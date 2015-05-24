#Developing Data Products - Coursera Course Assignment

This repository have the following files:

* ihacApp/ui.R
* ihacApp/server.R
* ihacApp/common.R

##ihacApp/ui.R

Basically configures the screen with five checkboxes. The first checkbox filter the only the active students. The other four checkboxes filter the four courses.

##ihacApp/server.R

The server is a simple shiny app, its use a reactive function to load the data only if the filter changes. The plot is performed when any filter selection changes.

##ihacApp/common.R

This file contains the sock codes used in both UI and Server files.
