# ===============================================================================
# File Name     : <table2tex.tex
# Description   : EU Horizon Proposal Convert Excel File to LaTeX Tables
# -------------------------------------------------------------------------------
# Author        : Amit Manohar Manthanwar
# Mailer        : manthanwar@hotmail.com
# WebURL        : https://manthanwar.github.io/
# -------------------------------------------------------------------------------
# Copyright     : ©2024 Amit Manohar Manthanwar
# License       : Restricted
# ===============================================================================
# ---------------+---------+----------------------------------------------------
# Revision Log  | Author  | Description
# ---------------+---------+----------------------------------------------------
# 01-Mar-2024   | AMM     | Initial Version
# ---------------+---------+----------------------------------------------------
# ---------------+---------+----------------------------------------------------
# ---------------+---------+----------------------------------------------------
# ---------------+---------+----------------------------------------------------
# ===============================================================================

import os
import time
import pandas as pd

timeStarted = time.time()

print('Pandas Version ', pd.__version__)
print('Current Working Directory:',  os.getcwd())

# directory of auto generated files
directory = 'PyTeX'
if not os.path.exists(directory):
    os.makedirs(directory)

print('Creating LaTeX Input Files from Excel Tables to ' + directory)


def call():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Call', header=None)
    agency = df.iloc[0, 1]
    callLink = df.iloc[1, 1]
    topicID = df.iloc[2, 1]
    projectID = df.iloc[3, 1]
    acronym = df.iloc[4, 1]
    dueDate = df.iloc[5, 1]
    title = df.iloc[6, 1]
    subtitle = df.iloc[7, 1]
    formName = df.iloc[8, 1]
    formVersion = df.iloc[9, 1]

    texFormName = '\\renewcommand{\\callOrg}{' + formName + '}'
    texPropVer = '\\renewcommand{\\propVer}{' + formVersion + '}'

    texCallRef = r'\renewcommand{\callRef}{\href{' + \
        callLink + r'}{\textcolor{black}{' + topicID + '}}}'
    texPropIdn = r'\renewcommand{\propIdn}{' + projectID + '}'
    texAcronym = r'\renewcommand{\acronym}{' + acronym + '}'
    texProject = r'\renewcommand{\project}{\Large{' + title + \
        r'}\\[2mm] \large{\textrm{' + subtitle + r'}}\\[2mm]}'
    texLines = texFormName + '\n' \
        + texCallRef + '\n' \
        + texPropIdn + '\n' \
        + texPropVer + '\n' \
        + texAcronym + '\n' \
        + texProject

    f = open('PyTeX/table-call.tex', 'w', encoding='utf-8')
    print(texLines, file=f)
    f.close()
    print(r'Created \input{Figures/table-call.tex}')


def table_Participants():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Participants')
    f = open('PyTeX/table-participants.tex', 'w', encoding='utf-8')
    texLines = '\\tableParticipants{%\n'
    for i in df.index:
        texLines += str(df.iloc[i, 0]) + ' & ' + df.iloc[i, 1] + ' & ' + \
            df.iloc[i, 2] + ' & ' + df.iloc[i, 3] + ' & ' + df.iloc[i, 4]
        if i < len(df)-1:
            texLines += '\\\\\n'

    texLines += '\n}'
    print(texLines, file=f)
    f.close()
    print(r'Created \input{Figures/table-participants.tex}')


def consortiumBio():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Bio')
    fn = 'PyTeX/sec-Consortium-Biographies.tex'
    fw = open(fn, 'w', encoding='utf-8')
    for i in df.index:
        texLines = '\\item \\textbf{' + \
            df.iloc[i, 0] + ':} ' + df.iloc[i, 1] + '\n'
        print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def abstract():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Abstract')
    abstract = df.iloc[0, 0]
    f = open('sec-abstract.tex', 'w', encoding='utf-8')
    print(abstract, file=f)
    f.close()
    print(r'Created \input{sec-participants.tex}')


def impactSummary(worksheet):
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name=worksheet)
    fn = 'PyTeX/sec-Impact-Summary-' + worksheet + '.tex'
    fw = open(fn, 'w', encoding='utf-8')
    for i in df.index:
        texLines = '\\item ' + df.iloc[i, 1]
        print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def table_WPs():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='WPs')
    fn = 'PyTeX/table-wps.tex'
    fw = open(fn, 'w', encoding='utf-8')
    texLines = '\\tableListofWPs{%\n'
    for i in df.index:
        texLines += 'WP' + \
            str(df.iloc[i]['WP']) + ' & ' + \
            str(df.iloc[i]['Title']) + ' & ' + \
            str(df.iloc[i]['Lead Participant No']) + ' & ' + \
            str(df.iloc[i]['Lead Participant Short Name']) + ' & ' + \
            str(df.iloc[i]['Person Months']) + ' & ' + \
            str(df.iloc[i]['Start Month']) + ' & ' + \
            str(df.iloc[i]['End Month'])
        if i < len(df)-1:
            texLines += '\n\\\\\\hline\n'
        else:
            texLines += '\n\\\\\n'

    texLines += '}{' + str(int(df.iloc[0, 8])) + '}'
    print(texLines, file=fw)
    fw.close()
    print('Created \\input{' + fn + '}')


def wp_Tables(noTeams, noWPs):
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Efforts')
    df2 = pd.read_excel(r'Tables/tables.xlsx', sheet_name='WPs')

    for wpn in range(1, noWPs+1):
        wp = 'WP' + str(wpn)
        wpTitle = df2.iloc[wpn-1]['Title']
        wpLead = df.iloc[noTeams+2][wp]
        startMon = df.iloc[noTeams+4][wp]
        finalMon = df.iloc[noTeams+5][wp]
        wpLead = df.iloc[noTeams+2][wp]
        teamNam = []
        teamNum = []
        teamMon = []

        for i in range(6):
            teamNum.append('')
            teamNam.append('')
            teamMon.append('')

        n = 0
        for i in range(noTeams):
            if not pd.isna(df.iloc[i][wp]):
                teamNum[n] = int(df.iloc[i]['No'])
                teamNam[n] = df.iloc[i]['Acronym']
                teamMon[n] = int(df.iloc[i][wp])
                n = n + 1

        texLines = '\\tableWorkPackage[%' + '\n' + \
            'wpTitle=' + wpTitle + ',%' + '\n' + \
            'wpTeamLead=' + wpLead + ',%' + '\n' + \
            'wpTeamAnum=' + str(teamNum[0]) + ',%' + '\n' + \
            'wpTeamBnum=' + str(teamNum[1]) + ',%' + '\n' + \
            'wpTeamCnum=' + str(teamNum[2]) + ',%' + '\n' + \
            'wpTeamDnum=' + str(teamNum[3]) + ',%' + '\n' + \
            'wpTeamEnum=' + str(teamNum[4]) + ',%' + '\n' + \
            'wpTeamFnum=' + str(teamNum[5]) + ',%' + '\n' + \
            'wpTeamAnam=' + teamNam[0] + ',%' + '\n' + \
            'wpTeamBnam=' + teamNam[1] + ',%' + '\n' + \
            'wpTeamCnam=' + teamNam[2] + ',%' + '\n' + \
            'wpTeamDnam=' + teamNam[3] + ',%' + '\n' + \
            'wpTeamEnam=' + teamNam[4] + ',%' + '\n' + \
            'wpTeamFnam=' + teamNam[5] + ',%' + '\n' + \
            'wpTeamAMon=' + str(teamMon[0]) + ',%' + '\n' + \
            'wpTeamBMon=' + str(teamMon[1]) + ',%' + '\n' + \
            'wpTeamCMon=' + str(teamMon[2]) + ',%' + '\n' + \
            'wpTeamDMon=' + str(teamMon[3]) + ',%' + '\n' + \
            'wpTeamEMon=' + str(teamMon[4]) + ',%' + '\n' + \
            'wpTeamFMon=' + str(teamMon[5]) + ',%' + '\n' + \
            'wpStartMon=' + str(startMon) + ',%' + '\n' + \
            'wpFinalMon=' + str(finalMon) + '%\n]'

        fn = 'PyTeX/wp' + str(wpn) + '-table.tex'
        fw = open(fn, 'w', encoding='utf-8')
        print(texLines, file=fw)
        fw.close()
        print('Created \\input{' + fn + '}')


def rm_Objectives():
    for i in range(1, 7):
        fn = 'PyTeX//wp' + str(i) + '-objectives.tex'
        if os.path.exists(fn):
            os.remove(fn)


def wp_Objectives():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='WPs')
    df = df.fillna('')
    df = df.sort_values(by=['WP'])

    for i in df.index:
        fn = 'PyTeX/wp' + str(i+1) + '-objectives.tex'
        fw = open(fn, 'w', encoding='utf-8')
        texLines = '\\textbf{Objectives}\\\\\n'
        texLines += str(df.iloc[i]['Objectives'])
        texLines += '\n\\par\n'
        print(texLines, file=fw)
        fw.close()
        print(r'Created \input{' + fn + '}')


def wp_Tasks():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Tasks')
    df = df.fillna('')
    df = df.sort_values(by=['Task'])

    for j in range(1, max(df[:]['WP'])+1):
        fn = 'PyTeX/wp' + str(j) + '-tasks.tex'
        fw = open(fn, 'w', encoding='utf-8')
        texLines = '\\textbf{Description of work}\\\\\n'
        for i in df.index:
            if df.iloc[i]['WP'] == j:
                deliverables = ''
                for n in range(1, int(df.iloc[i]['Deliverables']) + 1):
                    if n == int(df.iloc[i]['Deliverables']):
                        deliverables += 'D' + str(n)
                    else:
                        deliverables += 'D' + str(n) + ', '

                milestones = ''
                for m in range(1, int(df.iloc[i]['Milestones']) + 1):
                    if m == int(df.iloc[i]['Milestones']):
                        milestones += 'M' + str(m)
                    else:
                        milestones += 'M' + str(m) + ', '

                texLines += '\\task{' + \
                    str(df.iloc[i]['Task']) + '}{' + \
                    deliverables + '}{' + \
                    milestones + '}{' + \
                    str(df.iloc[i]['Title']) + '}{' + \
                    str(df.iloc[i]['Lead']) + '}{' + \
                    str(df.iloc[i]['Collaborators']) + '}{' + \
                    str(df.iloc[i]['Start']) + '}{' + \
                    str(df.iloc[i]['End']) + '}\\\\' + '\n'
                texLines += df.iloc[i]['Description'] + '\n\n'

        print(texLines, file=fw)
        fw.close()
        print(r'Created \input{' + fn + '}')


def wp_Deliverables():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Deliverables')
    df = df.fillna('')
    df = df.sort_values(by=['Task'])

    for j in range(1, max(df[:]['WP'])+1):
        fn = 'PyTeX/wp' + str(j) + '-deliverables.tex'
        fw = open(fn, 'w', encoding='utf-8')
        texLines = '\\textbf{\\underline{Deliverables}}\\\\\n'
        for i in df.index:
            if df.iloc[i]['WP'] == j:
                texLines += '\\deliverable{' + \
                    str(df.iloc[i]['Task']) + ' D' + \
                    str(df.iloc[i]['Deliverable']) + '}{' + \
                    str(df.iloc[i]['Lead']) + '}{' + \
                    str(df.iloc[i]['Contributors']) + '}{' + \
                    str(df.iloc[i]['Month']) + '}{' + \
                    str(df.iloc[i]['Title']) + ' Verification: ' + \
                    str(df.iloc[i]['Verification']) + '}\\\\' + '\n\n'

        print(texLines, file=fw)
        fw.close()
        print(r'Created \input{' + fn + '}')


def wp_Milestones():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Milestones')
    df = df.fillna('')
    df = df.sort_values(by=['Task'])

    for j in range(1, max(df[:]['WP'])+1):
        fn = 'PyTeX/wp' + str(j) + '-milestones.tex'
        fw = open(fn, 'w', encoding='utf-8')
        texLines = '\\textbf{\\underline{Milestoness}}\\\\\n'
        for i in df.index:
            if df.iloc[i]['WP'] == j:
                texLines += '\\milestone{' + \
                    str(df.iloc[i]['Task']) + ' M' + \
                    str(df.iloc[i]['Milestone']) + '}{' + \
                    str(df.iloc[i]['Lead']) + '}{' + \
                    str(df.iloc[i]['Contributors']) + '}{' + \
                    str(df.iloc[i]['Month']) + '}{' + \
                    str(df.iloc[i]['Title']) + ' Verification: ' + \
                    str(df.iloc[i]['Verification']) + '}\\\\' + '\n\n'

        print(texLines, file=fw)
        fw.close()
        print(r'Created \input{' + fn + '}')


def table_Deliverables():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Deliverables')
    df = df.fillna('')
    df = df.sort_values(by=['Month'])
    fn = 'PyTeX/table-deliverables.tex'
    fw = open(fn, 'w', encoding='utf-8')
    texLines = '\\tableListofDeliverables{\n'
    for i in df.index:
        texLines += \
            str(df.iloc[i]['Task']) + ' D' + \
            str(df.iloc[i]['Deliverable']) + ' & ' + \
            str(df.iloc[i]['Title']) + ' & WP' + \
            str(df.iloc[i]['WP']) + ' & ' + \
            str(df.iloc[i]['Lead']) + ' & ' + \
            str(df.iloc[i]['Type']) + ' & ' + \
            str(df.iloc[i]['Level']) + ' & ' + \
            str(df.iloc[i]['Month']) + '\\\\\\hline' + '\n'

    texLines += '}\n'

    print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def table_Milestones():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Milestones')
    df = df.fillna('')
    df = df.sort_values(by=['Month'])
    fn = 'PyTeX/table-milestones.tex'
    fw = open(fn, 'w', encoding='utf-8')
    texLines = '\\tableListofMilestones{\n'
    for i in df.index:
        texLines += \
            str(df.iloc[i]['Task']) + ' M' + \
            str(df.iloc[i]['Milestone']) + ' & ' + \
            str(df.iloc[i]['Title']) + ' & WP' + \
            str(df.iloc[i]['WP']) + ' & ' + \
            str(df.iloc[i]['Month']) + ' & ' + \
            str(df.iloc[i]['Verification']) + '\\\\\\hline' + '\n'

    texLines += '}\n'

    print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def table_Risks():
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Risks')
    df = df.fillna('')
    fn = 'PyTeX/table-risks.tex'
    fw = open(fn, 'w', encoding='utf-8')
    texLines = '\\tableListofRisks{\n'
    for i in df.index:
        texLines += \
            str(df.iloc[i]['Risk Description']) + ' & ' + \
            str(df.iloc[i]['Likelihood/Severity']) + ' & ' + \
            str(df.iloc[i]['Related WPs']) + ' & ' + \
            str(df.iloc[i]['Proposed risk-mitigation measures']) + \
            '\\\\\\hline' + '\n'

    texLines += '}\n'

    print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def table_Efforts(noTeams, noWPs):
    df = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Efforts')
    df = df.fillna('')
    fn = 'PyTeX/table-efforts.tex'
    fw = open(fn, 'w', encoding='utf-8')
    texLines = '\\tableStaffEffortsSummary{\n'
    for i in range(noTeams):
        texLines += str(int(df.iloc[i]['No'])).zfill(2) + \
            '. ' + str(df.iloc[i]['Acronym']) + ' & '
        for j in range(1, noWPs+1):
            texLines += str(df.iloc[i]['WP'+str(j)]) + ' & '

        texLines += str(int(df.iloc[i]['Months'])) + ' \\\\\\hline' + '\n'

    texLines += '}{'
    for j in range(1, noWPs+1):
        if j == noWPs:
            texLines += str(df.iloc[noTeams+3]['WP'+str(j)])
        else:
            texLines += str(df.iloc[noTeams+3]['WP'+str(j)]) + ' & '

    texLines += '\n}{' + str(int(df.iloc[noTeams+3]['Months'])) + '}'

    print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


def table_Efforts_Justification(noTeams):
    dft = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Tasks')
    dfe = pd.read_excel(r'Tables/tables.xlsx', sheet_name='Efforts')
    dft = dft.fillna('')
    dfe = dfe.fillna('')
    dft = dft.sort_values(by=['Task'])
    # dfe = dfe.iloc[0:noTeams,:].sort_values(by=['No'])

    texLines = '\\tableStaffEffortsJustification{\n'
    personMonths = 0
    for e in range(noTeams):
        team = dfe.iloc[e]['Acronym']
        effortLines = str(int(dfe.iloc[e]['No'])).zfill(
            2) + '. ' + team + ' & '
        assignTasks = ''
        totalMonths = 0
        for t in dft.index:
            lead = dft.iloc[t]['Lead']
            if team == lead:
                assignTasks += str(dft.iloc[t]['Task']) + \
                    '/' + str(int(dft.iloc[t]['Months'])) + ', '
                totalMonths += int(dft.iloc[t]['Months'])

        personMonths += totalMonths
        effortLines += assignTasks[:-2] + ' & ' + \
            str(totalMonths) + '\\\\\\hline\n'
        texLines += effortLines

    texLines += '}{' + str(personMonths) + '}'
    fn = 'PyTeX/table-efforts-justifcation.tex'
    fw = open(fn, 'w', encoding='utf-8')
    print(texLines, file=fw)
    fw.close()
    print(r'Created \input{' + fn + '}')


call()
table_Participants()
abstract()
impactSummary(worksheet='Needs')
impactSummary(worksheet='Results')
impactSummary(worksheet='Dissemination')
impactSummary(worksheet='Communication')
impactSummary(worksheet='Exploitation')
impactSummary(worksheet='Target')
impactSummary(worksheet='Outcomes')
impactSummary(worksheet='Impact')
consortiumBio()
table_WPs()
wp_Tables(noTeams=12, noWPs=6)
wp_Objectives()
wp_Tasks()
wp_Deliverables()
wp_Milestones()
table_Deliverables()
table_Milestones()
table_Risks()
table_Efforts(12, 6)
table_Efforts_Justification(noTeams=12)

# rm_Objectives()

timeStopped = time.time()
timeElapsed = timeStopped - timeStarted

# print(timeStarted)
# print(timeStopped)
print('time elapsed = ' + f'{timeElapsed:.4f}' + ' seconds')
