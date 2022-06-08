# sse-results

Copyright 2022 Michael George (AKA Logiqx).

This file is part of [sse-results](https://github.com/Logiqx/sse-results) and is distributed under the terms of the GNU General Public License.

sse-results is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

sse-results is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with sse-results. If not, see <https://www.gnu.org/licenses/>.



## Overview

This project was originally created to produce the daily and weekly results for [Weymouth Speed Week](https://www.speedsailing.com/) 2022.

Generic features have subsequently been separated out to create this project; Speed Sailing Event Results / sse-results.



## Features

This project has become rather more elaborate than originally planned and now has the following features:

- Generates sped sailing event results.
  - Daily and weekly reports.
  - Configurable categories; e.g. craft, fleet, age categories, etc.
  - Country flags are shown where known for the competitors.
  - Prizes and records are highlighted by emojis, where applicable.
- PLANNED - Events such as the UKWA Speed Championship and ISWC competitions will automatically be scored where applicable.
  - Qualifying criteria will be applied, dependent on course type.
  - Results will be calculated based on the average of each competitors best runs.
  - Series discards will be applied, where applicable.
  - Tiebreak rules will be applied in the event of equal points.
- Heaps of data validation
  - The main goal is to get results produced quickly and reliably, without crashing due to minor data issues.
  - Data issues are automatically fixed (where possible) or at the very least least, highlighted to the person running the reports.
    - Duplicate runs due to multiple GT-31s or multiple files (SBP and SBN) are automatically de-duplicated.
  - Reading the [diagnostics](docs/tech/diagnostics.md) document will provide insight into the results processing and the handling of data issues.
  - Extensive unit testing and thorough system testing has been undertaken and is described later in this document.

Note: Different course lengths can be reported separately and will not impact 500m records.



## Fuzzy Name Matching

Competitors often register with slight variations in how their name is written. For example:

- Ed Murrell, Eddie Murrell and Edward Murrell are the same person.
- Bob Spagnoletti and Robert Spagnoletti are the same person.
- Trevor Watford and Trevor Whatford are the same person, despite the typo.

This project implements a bespoke "fuzzy matching" algorithm to spot name variations and highlight them during report generation.

Editing the relevant entrants to make the names consistent across all years ensures that competitor profiles are as accurate as possible.

The bespoke "fuzzy matching" algorithm uses a combination of a nickname lookup, [Soundex](https://en.wikipedia.org/wiki/Soundex) and [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance).

The algorithm itself will not be explained in this document but the code can be found in [fuzzy.ipynb](python/fuzzy.ipynb) and [name.ipynb](python/name.ipynb).

There are 3 main reasons for building this "fuzzy matching" functionality as actual code:

1. The initial process of getting competitor names consistent across all years is a lot less tedious and less prone to error.
2. The automated testing which compares newly generated WSW results with past results can recognise names in the original results.
3. All future competitors with "fuzzy matches" to names in previous years can be highlighted automatically by the reporting process.



## Unit Testing

The project includes pretty extensive unit testing within all of the Python modules:

- Core functionality for all of the classes / modules is tested during the software build.
- Results generated for WSW (1998-2009) are automatically compared against what was originally published, where available:
  - Course results
  - Session results
  - Event results
- Results for all of the WSW categories since 2005 have been thoroughly checked and reconciled - e.g. Youths, Masters, Gold Fleet, etc.
- n.b. The "fuzzy name matching" algorithm is utilised when comparing results of past years against what was originally published.

Thorough unit testing ensures that the software can be trusted for all past results and will accurately generate results in the future.



### Technical Docs

Full technical documentation is being maintained in a separate [document](docs/tech/README.md) within the GitHub repository.

