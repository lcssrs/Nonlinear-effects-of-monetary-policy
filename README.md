# README

This directory has all the scripts used in the paper _Nonlinear effects of monetary policy in the Eurozone_ while the extraction and cleaning part of the data are mainly in python the the estimations, plotting and results generation where written in Matlab.
Most of the scripts have a description of their functionality but this document maps it succintly and build the big picture.

Python scripts
  Building dataset.ipynb
  This script mainly organizes the data extracted from the ECB forecasts.ipynb and refi.ipynb scripts in a convenient way so that we can apply the procedure described in Miranda-Agrippino and Ricco (2021) to clean the 
  high-frequency instrument through auxiliary regressions. Later on the script saves all the instruments using a convenient name to be used in the Matlab scripts that perform the nonlinear VAR estimations

  ECB forecasts.ipynb
  This script basically collects data about the forecasts made by the ECB for macroeconomic variables through webscrapping the dates when the forecasts were released and accurately pairing with the actual value of the forecast that is generated using the 
  refi.ipynb script. Then ECB forecasts.ipynb mathces all data correctly so that regressions can be ran. 

  refi.ipynb
  This is the script where the actual values of forecasts are exctracted from the Refinitiv Datastream platform. We used this automation routine through pyautogui library because the Datastream software did not allow download of a large amount of data at once 

Matlab scripts
