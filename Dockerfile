FROM tensorflow/tensorflow:1.10.0-py3
LABEL maintainer="Zhe Wu <zwu@kinetica.com>"

RUN apt-get update && \
        apt-get install -y \
        build-essential \
        git \
        wget \
        unzip \
        yasm \
        vim \
        sudo \
        unixodbc-dev unixodbc-bin unixodbc # all the odbc driver


RUN pip3 --no-cache-dir install \
        numpy \
        gpudb \
        http://download.pytorch.org/whl/cpu/torch-0.4.1-cp35-cp35m-linux_x86_64.whl \
        torchvision \
        jupyterlab \
        seaborn \
        pyodbc
        
COPY odbc/odbc.ini /etc/
COPY odbc/odbcinst.ini /etc/
COPY odbc/libSimbaClient.so.tar.gz /tmp/libSimbaClient.so.tar.gz
COPY odbc/kodbc_io.py /usr/lib/python3.5/

RUN tar -xvf /tmp/libSimbaClient.so.tar.gz /usr/local/lib/


COPY jupyter_notebook_config.py /root/.jupyter/
