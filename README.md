# alb-demo 🦜
A demonstration of [albumentations library](https://github.com/albumentations-team/albumentations.git).

The whole demo is a jupyter notebook at `notebooks/demo.ipynb`.

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

### Useful links

* docs: https://albumentations.ai/docs/
* benchmarks: https://github.com/albumentations-team/albumentations/blob/master/README.md#benchmarking-results
* more examples: https://github.com/albumentations-team/albumentations_examples
* AutoAlbument: https://github.com/albumentations-team/autoalbument
* Faster AutoAugment (base paper of AutoAlbument): https://arxiv.org/pdf/1911.06987.pdf
