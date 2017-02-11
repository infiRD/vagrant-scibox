# Scibox

Vagrant box aimed at bootstraping the work with scientific computation packages
like [jupyter](http://jupyter.org/) and [julia](http://julialang.org/)

## Getting Started

First of all you will need to [install vagrant](https://www.vagrantup.com/docs/installation/). Then:

```bash
cd ~
git clone https://github.com/infiRD/Scibox.git
cd Scibox
vagrant up && vagrant ssh
```

## Based on

* [VAGRANT](https://www.vagrantup.com/) - VM manager
* [conda](https://github.com/conda/conda) - Conda package manager
* [jupyter/notebook](https://github.com/jupyter/notebook) - jupyter notebooks
* [JupyterLab](https://github.com/jupyter/notebook) - JupyterLab computational environment
* [julia](https://github.com/JuliaLang/julia) - Julia language

## Versioning
We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/infiRD/Scibox/tags)

## Authors

* **Martin Zamba** - *Initial work* - [infiRD](https://github.com/infiRD)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Contributing

Contributions to scibox are welcome. Just fork the GitHub repository and send a pull request
