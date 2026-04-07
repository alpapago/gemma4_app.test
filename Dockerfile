# 1. NVIDIA CUDA + PyTorch 베이스 이미지 (H200 호환 버전)
FROM nvidia/cuda:12.1.0-base-ubuntu22.04

# 2. 파이썬 및 필수 도구 설치
RUN apt-get update && apt-get install -y python3-pip git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 3. 모델 구동을 위한 라이브러리 추가 (transformers, accelerate, bitsandbytes)
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# 4. 소스 복사
COPY main.py .

# 5. 실행 (Gemma는 메모리를 많이 먹으므로 가상 메모리 최적화 환경 권장)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
