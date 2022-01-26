# wsw-results

## Overview

This project was originallly created to produce the daily and weekly results for [Weymouth Speed Week](https://www.speedsailing.com/) 2022.

It supersedes the Excel macros (SSERPANT) that were used to generate the WSW results between 2010 and 2021.



## Features

This project has become rather more elaborate than originally planned and now has the following features:

- Generates Weymouth Speed Week (WSW) results for all years since 1998.
  - Daily and weekly reports.
  - Overall results (including craft types) and competitor profiles are planned across multiple years.
  - Country flags are shown where known for the competitors.
  - Prizes and records are highlighted by emojis, where applicable.
  - Categories (e.g. Gold Fleet) have varied over the years and have been applied to historical results accordingly.
- PLANNED - Records will be highlighted in reports and competitor profiles;historically and during an event.
  - Overall records
  - Records by craft type; Boat, Windsurfer, Kiteboard, etc.
  - Female records; overall, craft type, etc.
- PLANNED - Events such as the UKWA Speed Championship and ISWC competitions will automatically be scored where applicable.
  - Qualifying criteria will be applied, dependent on course type.
  - Results will be calculated based on the average of each competitors best runs.
  - Series discards will be applied, where applicable.
  - Tiebreak rules will be applied in the event of equal points.
- Heaps of data validation
  - The main goal is to get results produced quickly and reliably, without crashing due to minor data issues.
  - Data issues are automatically fixed (where possible) or at the very least least, highlighted to the person running the reports.
    - Gold Fleet and Pro Fleet entrants will have the "first timer" flag set to "N" from the first timer.
    - Duplicate runs due to multiple GT-31s or multiple files (SBP and SBN) are automatically de-duplicated.
    - 2-day entrants exceeding their entry are highlighted to the event organisers.
  - Reading the [diagnostics](docs/tech/diagnostics.md) document will provide insight into the results processing and the handling of data issues.
  - Extensive unit testing and thorough system testing has been undertaken and is described later in this document.

Note: The years 2000 and 2001 had 200m, 300m and 700m courses which are reported separately and will not impact 500m records.



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

1. The initial process of getting competitor names consistent between 1998 to 2021 was a lot less tedious and less prone to error.
2. The automated testing which compares newly generated results with past results can recognise the names in the original results.
3. All future competitors with "fuzzy matches" to names in previous years can be highlighted automatically by the reporting process.



## Unit Testing

The project includes pretty extensive unit testing within all of the Python modules:

- Core functionality for all of the classes / modules is tested during the software build.
- Results generated for past years (1998-2009) are automatically compared against what was originally published, where available:
  - Course results
  - Session results
  - Event results
- Results for all of the categories since 2005 have been thoroughly checked and [reconciled](docs/tech/reconciliation.md) - e.g. Youths, Masters, Gold Fleet, etc.
- n.b. The "fuzzy name matching" algorithm is utilised when comparing results of past years against what was originally published.

Thorough unit testing ensures that the software can be trusted for all past results and will accurately generate results in the future.



### Technical Docs

Full technical documentation is being maintained in a separate [document](docs/tech/README.md) within the GitHub repository.

