#Developing Data Products - Coursera Course Assignment

This repository have the followin files:

* stockAnalysis/ui.R
* stockAnalysis/server.R
* stockAnalysis/common.R

##stockAnalysis/ui.R

Basically configures the screen with one selection box, one slider and three checkboxes. The selection box intends to allows the user to select the stock code. The slider allows the user to define the window in days, and the checkboxes allows the configuration about the information presented in the graph.

##stockAnalysis/server.R

The server is a simple shiny app, its use a reactive function to load the data only if the window lenght is altered. The plot is performed when any parameter changes.

##stockAnalysis/common.R

This file contains the sock codes used in both UI and Server files.
