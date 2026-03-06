# github인증 방법 2가지
# 1. oauth인증방식(제3자인증-웹로그인)
# 2. pat(personal access token)인증
# 발급한 키를 키체인(자격증명)에 등록

# git 프로젝트 생성 방법 2가지
# 방법1. github에서 진행중인 원격 repo를 clone 
# 방법2. 로컬에서 부터 이미 진행중인 프로젝트를 github에 업로드
# 해당 프로젝트 위치에 .git폴더(repo주소, 사용자 정보 등)가 생성
git init 

# 원격지 주소를 생성 및 추가
git remote add origin 레포주소(https://github.com/kimjoy0914/new_git_github.git)

# 원격지 주소 확인
git remote -v

# 원격지 주소 삭제
git remote remove origin

# 원격지 주소 변경
git remote set-url origin 레포주소(https://github.com/kimjoy0914/new_git_github.git)