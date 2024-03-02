# TeX-EURIA

LaTeX Proposal for the EU Horizon Research Innovation Action

## About TeX-EURIA

This package contains a LaTeX class file `euria.cls` to create proposals for the EU Horizon Research Innovation Actions. Data from an Excel file `Tables/tables.xlsx` is converted into an appropriate set of TeX files using the Python code `tables2tex.py`. A good working knowledge of LaTeX and Python should be sufficient to use the package.

## Repository

This package and its user manual are available at [GitHub](https://github.com/manthanwar/TeX-EURIA).

### Excel Worksheets

The Excel file `Tables/tables.xlsx` contains the following worksheets:

#### Main

- Proposal
- Call
- Participants
- Bio
- Abstract

#### Work Packages

- WPs
- TasksList
- Tasks
- Efforts
- Deliverables
- Milestones
- Risks

#### Budget Tables

- Rates
- StaffEfforts
- Budget
- Resources
- Gantt

#### Impact-Summary

- Needs
- Results
- Dissemination
- Communication
- Exploitation
- Target
- Outcomes
- Impact

## Installation and usage of **TeX-EURIA**

### Installation

As prerequisites for *TeX-EURIA*, you need working
versions of LaTeX and Python. The style files and all corresponding **.tex** and **.eps** assets must be somewhere in your TeX-input path, where *dvips* can find it. Download the zip file from the \texttt{pst-flags} [project page on GitHub](https://github.com/manthanwar/TeX-EURIA) and unzip it in the same location as your tex file. Try to compile using the classic `latex -> dvips -> ps2pdf` toolchain or use the supplied `makefile`.

### Dependencies

This packages requires Python with Pandas and LaTeX with required packages listed in the `euria.cls` file.

### Usage

- Prepare `Tables/tables.xlsx`
- run `python tables2tex.py`
- run `make build`

## License

Copyright © 2024 Amit M. Manthanwar. Permission is granted to
copy, distribute and/or modify this software under the terms of the MIT License.

## Feedback

Please use the TeX-EURIA [project page on GitHub](<https://github.com/manthanwar/TeX-EURIA>) to report bugs and submit feature requests. Before making a feature request, please ensure that you have thoroughly studied this manual and corresponding codes. If you do not want to report a bug or request a feature but are simply in need of assistance, you might want to consider posting your question on the the comp.text.tex newsgroup or [TeX-LaTeX Stack Exchange](https://tex.stackexchange.com/questions).

## Support

If you run into any issue then please raise it at our [project page on GitHub](https://github.com/manthanwar/TeX-EURIA/issues).

## Collaboration

For all collaboration related queries please contact the author via email provided in the style file.
