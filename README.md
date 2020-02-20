
<!-- README.md is generated from README.Rmd. Please edit that file -->

# movienetData <img src="man/figures/README-logo.png" align="right" height="120"/>

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/movienetData)](https://cran.r-project.org/package=movienetData)
[![repo
size](https://img.shields.io/github/repo-size/pj398/movienetData)](https://github.com/pj298/movienetData)
<!-- badges: end -->

This is a data package containing character interaction data for a
number of popular films. The package is intended as an accompaniment to
the `movienet` package (under development), but the data can be used for
any purpose.

The films currently contained in the package are:

  - the first 18 films of the Marvel Cinematic Universe (from *Iron Man*
    (2008) to *Black Panther* (2018));
  - the 4 films in *The Hunger Games* series (2012-2015);
  - the 3 *Tomb Raider* films, including the two *Lara Croft: Tomb
    Raider* films (2001-2003) as well as the 2018 reboot;
  - 5 miscellaneous other films (*Frozen* (2013), *The Breakfast Club*
    (1985), *Star Wars: The Force Awakens* (2015), *Alien* (1979), and
    *Wonder Woman* (2017).

The data were gathered as part of my research on using character
networks to study the representation of women in film. To learn more
about that research, a good place to start is [this
paper](https://doi.org/10.1080/14680777.2018.1510846).

#### Format

Each film is stored as a list containing three elements:

1.  The event list. Each row contains information on a line of dialogue,
    with columns corresponding to `eventID`, `sceneID`, `speakerID`, and
    dummy variables for each recipient.
2.  The node list. Rows correspond to named speaking characters, with
    columns corresponding to variables for ID, name, total lines spoken
    (`nlines`), total times spoken to (`linesin`), and gender.
3.  The adjacency matrix. This is derived from the event list through
    aggregation and can be useful for static purposes such as
    visualising the network as a sociogram.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pj398/movienetData")
```

## Example

Load data:

``` r
library(movienetData)
data("marvel_01", package = "movienetData")
```

Access specific elements by name or by indexing the list:

``` r
# Get the nodes by name
marvel_01$node_list
```

``` r
# Get the nodes by indexing
marvel_01[[2]]
```

Browse the full list of movies by running:

``` r
data(package = "movienetData")
```

## Usage

Feel free to use the data for whatever you want. To cite the data,
either cite the package directly (e.g. via `citation(package =
"movienetData")`) or the relevant publication from my associated
research.
