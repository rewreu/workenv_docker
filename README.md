# workenv_docker

### Tags

There are cpu version and gpu version. For each version, there are two tags:
one with odbc for Kinetica, one without odbc.

`rewreu/workenv_docker:cpu` and  `rewreu/workenv_docker:latest` are the same image.

`rewreu/workenv_docker:cpu_kodbc` has odbc for Kinetica setup on `rewreu/workenv_docker:cpu`.

`rewreu/workenv_docker:gpu` is similar to `rewreu/workenv_docker:cpu` with GPU capability plus compiled **OpenCV**.

`rewreu/workenv_docker:gpu_kodbc` has odbc for Kinetica setup on `rewreu/workenv_docker:gpu`.

### Usage
```
docker run -d -p 8888:8888 -v  /hostnotebookpath:/notebooks \
--name workenv rewreu/workenv_docker:tag
```

for GPU
```
nvidia-docker run -d -p 8888:8888 -v  /hostnotebookpath:/notebooks \
--name workenv rewreu/workenv_docker:tag
```

### Change Jupyter password
You will be asked for jupyter password at `localhost:8888/lab`. 
To change password
1. Run `docker exec -it yourcontainer name bash`.
2. Modify `jupyter_notebook_config.py` at `/root/.jupyter/`.
3. Use ipython to generate your own password hash
4. Use the new hash to substitute value for `c.NotebookApp.password` in `jupyter_notebook_config.py`.

### ODBC IP

For the tags with kodbc only.

By default the odbc driver is using `127.0.0.1` for database address, modify it in `/etc/odbc.ini`

