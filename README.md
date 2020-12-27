# Source for `jacksonpetty.org`, et al.

This repository contains the Pollen source code for `jacksonpetty.org`. The site
is statically generated and the output is pushed to the corresponding public
`jopetty.github.io` repository.

## Site organization
The main site, `jacksonpetty.org`, is hosted on GitHub Pages through the 
`jopetty.github.io` repository with a `CNAME` redirect to the `.org` domain name.
There are also several other domain names which redirect to `jacksonpetty.org`,
including:
* `jacksonpetty.nl`
* `simplices.org`
* `grapheme.xyz`
These redirects are handled through Hover. To update `jacksonpetty.org`, a new
version of the site must be pushed to `master` on `jopetty.github.io`.

## Build instructions

To build a new version of the site, run the following command in the terminal 
from the root directory of the repository.
```
raco pollen reset website && make
```
This will delete and regenerate the `_website` directory containing the static
files for the site. This can then be pushed as a git submodule to the public
repository. 

To host a local server at the project root, simply `cd` into the `website`
directory and issue the `raco pollen start` command, then view the site at
`localhost:8080/`. Alternatively, an optional argument may be appended to start 
a web server at the `_website` directory to view changes.
```
raco pollen reset website && make && python -m http.server 8080 -d _website
```
