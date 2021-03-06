# syntax = docker/dockerfile:experimental

# Start from cuda image
ARG BASE_IMAGE
FROM $BASE_IMAGE

# Install python
ARG PYTHON_VERSION
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --no-install-recommends -y software-properties-common unzip wget python3-opencv && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-dev \
        python${PYTHON_VERSION}-venv \
        python${PYTHON_VERSION}-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python${PYTHON_VERSION} -m venv /venvs/base
ENV PATH="/venvs/base/bin:${PATH}"

# Install requirements
COPY requirements.txt /venvs/base/
RUN pip install --upgrade pip
RUN --mount="type=cache,target=/root/.cache/pip" \
    pip install -r /venvs/base/requirements.txt

# Configure user
ARG USER_ID
ARG GROUP_ID
RUN groupadd --gid $GROUP_ID docker && \
    adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID --shell /bin/bash docker && \
    adduser docker sudo && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Copy project files
COPY --chown=$USER_ID:$GROUP_ID . /alb-demo
RUN rm /alb-demo/requirements.txt
