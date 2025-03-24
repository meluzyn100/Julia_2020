# Solar System Project

This project is written in the Julia programming language and is used to simulate the motion of planets in the solar system. The project includes scripts and Jupyter notebooks that enable visualization and analysis of planetary motion.

## Project Structure

- **`elipsy.jl`** - Script containing functions related to elliptical orbit calculations of planets.
- **`PlanetSystem.jl`** - The main library of the project, defining classes and functions for modeling the planetary system.
- **`Projekt.jl`** - Script for running the solar system simulation.
- **`Julia Project Notebook.ipynb`** - Jupyter notebook containing data analysis and visualization.
- **`Julia Project Solar System.ipynb`** - Jupyter notebook with a simulation of planetary motion in the solar system.
- **`Project.toml`** - Julia project configuration file containing dependencies and project information.
- **`Readme.md`** - Project documentation (this file).
- **`rotation.gif`, `SolarSystem.gif`, `SolarSystem1.gif`, `SolarSystem2.gif`, `System.gif`** - GIF files showing visualizations of planetary motion.

## Requirements

To run the project, you need to install the Julia programming language and the required packages. The list of dependencies is in the `Project.toml` file.

## Getting Started
1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo/Julia_2020.git
    ```
2. Navigate to the project directory:
    ```bash
    cd Julia_2020/Projekt
    ```
3. Install dependencies:
    ```julia
    using Pkg
    Pkg.activate(".")
    Pkg.instantiate()
    ```
