# Configuration

## Background

The legacy Excel configuration was initially converted from CSV to JSON using an online tool:

- [Convert CSV to JSON](https://www.convertcsv.com/csv-to-json.htm)

Note: The only non-default option selected was 'Do Not output field/value pair if value is empty'



## Overview

This folder contains a number of configuration files to generate results for Weymouth Speed Week (WSW).

The configuration files are an evolution of the Excel spreadsheet that was used up to and including WSW 2021.

| Filename         | Description |
| ---------------- | ----------- |
| reports/*        | Folder containing report definitions |
| config.json      | Main configuration |
| README.md        | This file |
| stats.json       | Statistical summary definitions |



## Reports

Reports can have the following details in the JSON:

| Name       | Mandatory |   Values   | Comment                                                      |
| ---------- | :-------: | :--------: | ------------------------------------------------------------ |
| Average    |           |  integer   | The number of runs to be averaged (e.g. UKWA / ISWC = top 2 runs) |
| Fields     |     Y     |    text    | List of fields to be output                                  |
| Filter     |           |    text    | Filter conditions                                            |
| Limit      |           |  integer   | The maximum number of people to list in the report           |
| Period     |           |   "week"   | Whether to use fastest speeds of week. Default is day / session. |
| Rank       |           | "Y" or "N" | Whether the results should be ranked. Default is "Y"         |
| Session    |           |    text    | Used to lookup time limits for UKWA and ISWC sessions        |
| ShowSpeeds |           |  integer   | Can be used to display up to 10 speeds (e.g. verification report) |
| Sort       |           |    text    | Specify custom sort specification. Used for all runs, etc    |
| Subtitle   |           |    text    | Optional subtitle for the report                             |
| Title      |     Y     |    text    | Main title for the report                                    |
| WebPublish |           | "Y" or "N" | Whether the report will be published on the web (slightly redundant now) |



## TBC

A couple of oddities in the reporting filters need to be clarified:

1. "Leading Boats" excludes first timers, whereas "Leading Kites" does not exclude first timers.
2. "Women's Sailboard Fleet" excludes youths which isn't mentioned in the event guide.



Some additional rankings could also be added for 2022:

1. "All Kite Boards" could be added beneath "All Sailboards" on the leaderboard web page.
2. Wings could also be added in their own right, much like the kite and boat rankings.