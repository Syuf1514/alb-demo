# alb-demo 🦜
A demonstration of [albumentations](https://github.com/albumentations-team/albumentations.git).

The whole demo is just a jupyter notebook `notebooks/demo.ipynb`.

### Running with docker

Define environmental variables:
* `$USER_ID` and `$GROUP_ID`, equal to your user `id -u` and `id -g` respectively,
* `$BASE_IMAGE` equal to `ubuntu:20.04`,
* `$PYTHON_VERSION` equal to `3.9`.

You may store these variables in `.env` file in your project root along with any secrets and tokens
that your project needs. Just make sure it is not tracked by git.

Build an image and start a container, it will start a jupyter server automatically:
```
docker compose up --build alb_demo
```
