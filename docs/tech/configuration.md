## Configuration

PLEASE NOTE: THIS DOCUMENT IS ONLY A SKELETON AND YET TO BE WRITTEN.



### Application Configuration

TODO - document the application configuration.

- config/app.json
    - skipping previous years
    - increasing the verbosity
    - etc.



### Event Configuration

#### Event

TODO - document the event configuration.

- events/*yyyy*/config/event.json
    - Tweaking existing events; e.g. what should / should not be done.
    - Creating new event; e.g. how to set up a new event by cloning a previous event.

#### Entrants

TODO - document the entrants list.

- events/*yyyy*/config/entrants.csv

#### Reports

TODO - document the reports configuration.

- events/*yyyy*/config/reports/*.json - separate [reports](reports.md) document explains this in great detail.



### Session Configuration

TODO - document the session configuration files; course times, comments, etc.

#### Courses

- events/*yyyy*/sessions/*yyyymmdd*/courses.json

#### UKWA Rounds

- events/*yyyy*/sessions/*yyyymmdd*/ukwa.json

#### ISWC Rounds

- events/*yyyy*/sessions/*yyyymmdd*/iswc.json



### Reference Data

The reference files described in this section should not need further editing, either prior to or during a Weymouth Speed Week event.

#### Nationalities

TODO - Summarise the reference data for nationalities and flags.

- config/countries.txt - separate [countries](countries.md) document explains how this was created this in great detail.
- config/nationalities.txt

#### Name Lookups

TODO - Summarise the data used to refine the "fuzzy matching" of names.

- config/nicknames.txt
- config/relations.txt

#### Speed Records

TODO - Explain how records are tracked

- config/records.json
