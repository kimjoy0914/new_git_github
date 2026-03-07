## git 기본 명령어

add, commit, push, log status

git status - 현재 작업 디렉토리와 staging area의 상태를 보여주는 명령어

### git 취소상황
```txt
단계별 작업 취소
- working directory의 수정사항 취소(add전 취소)
  - 이때 취소는 굳이 CLI명령보다는 vscode, intellij에서 GUI로 함.
  - intellij사용시에는 settings>Git에서 Enable staging area체크확인.

커밋 이력을 만들어 버리게 되면 커밋 이력을 우리가 직접 없애줘야 한다.
이때는 CLI명령을 치는 것을 권장한다. 
그래서 명령어를 통해서 로컬 레포지토리 까지 반영한 내용을 취소해 본다. 
  


```

```bash
# commit이후의 취소
git reset head~1 #가장 최신 트랙킹을 이전 상태로 돌아감
# push 이후의 취소 -> commit메시지 작성 vi화면으로 이동됨 
# 이동하면 -> :wq하면 저장하고 빠져나옴. 
git revert 커밋ID # 커밋아이디는 git log로 확인
```
