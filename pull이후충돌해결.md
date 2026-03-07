## case별 git pull 이후 충돌 해결
### case1
ORIGIN과 local repository의 commit 이력이 같은 상황에서 local에서
working directory에서의 수정 이후 git pull -> 충돌상황X
- 이때에는 git pull origin main을 해도 변화 발생 없음(commit이력은 동일하므로)
- 이 상황은 pull을 받는 상황이 아닌, 수정 후에 commit push하거나 작업 사항을 취소해야 되는 상황
ORIGIN과 local repository의 commit 이력이 같은 상황에서 local에서만 commit 이력 추가 이후 
git pull -> 충돌상황X
- origin의 commit이력까지는 이미 local에 존재하므로, origin에서 받아올 변경사항이 존재하지 않음
- git push하면 되는 상황

### case2
ORIGIN에만 commit이력의 추가가 발생 -> 충돌상황X
git pull 또는 git pull origin브랜치명을 통해 commit이력사항 내려 받은 후 merge
병합의 일종으로 볼 수 있으나, 변경사항에 대한 head만 이동하므로 fast forward라 부름

### case3
ORIGIN에 commit이력의 추가가 발생 && 로컬에 별도 commit 이력 발생. 
그러나 같은 파일에 대한 수정은 아닌 경우 -> 충돌상황X
git pull시 문제 없이 실행되고, fast forward가 아닌 merge커밋 발생
- 이 경우 재 push가 필요

### case4
ORIGIN에 commit이력의 추가가 발생 && 로컬에 별도 commit생성 후 push 할 때에
충돌 발생. 가장 빈번한 상황
해결책
- 방법1
  - git pull origin main
  - 커밋 ID들 간의 변경 내용을 비교하여 만들어지는 병합파일 생성
  - 병합 파일을 적절하게 수정한 뒤 다시 add, commit 시에 merge commit 생성
  - 만들어진 병합 commit을 포함하여 재 push
- 방법2
  - git fetch -> git diff -> git merge origin/main(또는 git pull) -> 충돌해결 후 다시 push

### case5
ORIGIN에 commit이력의 추가가 발생 && 로컬 working directory 또는 staging에서
같은 작업시 git pull -> 충돌 발생
error: Your local changes to the following files would be overwritten by merge
- fetch까진 성공하였으나 파일 병합 과정에서 충돌(conflict)이 발생.
- local의 commit이력이 존재하지 않아 merge할 수 있는 병합파일이 생성되지 않음
해결책
- 방법1
  - local에서 커밋을 만들어 낸 뒤 git merge(pull) origin/main 충돌 제거 후 add, commit, push
- 방법2
  - 기존 수정본을 backup을 만들어두고, 로컬 작업을 취소 -> git pull origin main -> backup파일을
  참고하여 작업사항 반영
  - backup작업을 위해 git stash 활용 가능 