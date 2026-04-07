# 1. 베이스 이미지 선택 (파이썬 가벼운 버전)
FROM python:3.11-slim

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. 필수 패키지 설치를 위해 requirements.txt 먼저 복사
COPY app/requirements.txt .

# 4. 의존성 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# 5. 나머지 소스 코드 복사
COPY main.py .

# 6. 컨테이너가 사용할 포트 번호 노출
EXPOSE 8000

# 7. 앱 실행 명령어 (uvicorn 사용)
# --host 0.0.0.0은 외부 접속을 허용하기 위해 필수입니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
