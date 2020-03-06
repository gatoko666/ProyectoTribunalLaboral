*** Settings ***
Documentation     Proyecto que busca automatizar consultas hacia Civil Pjud.
...               Se necesitan las librerias instaladas para poder hacer funcionar el script.
Library           SeleniumLibrary
Library           ExcelLibrary
Library           clipboard
Library           String
Library           ImageHorizonLibrary
Library           DateTime

*** Variables ***
${Url}            https://laboral.pjud.cl/    # Direccion de la pagina a realizar las consultas
${PathExcel}      resultado/Nombres.xls    #Ubicacion de archivo Excel a consultar.
${NombreHojaExcel}    nombres    #Nombre de la hoja excel que se consulta.

*** Test Cases ***
Test1
    Open Browser    ${Url}    chrome
    Sleep    15s
    Select Frame    name=body
    Sleep    15s
    Click Element    //td[contains(@id,'tdCuatro')]
    Sleep    15s
    clipboard.Copy    Chacón
    Input Text    //input[contains(@name,'NOM_Consulta')]    diego
    Input Text    //input[contains(@name,'APE_Paterno')]    medel
    Click Element    //input[contains(@name,'APE_Materno')]
    Press Keys    none    CTRL+V
    Select From List By Value    name:COD_TribunalSinTodos    0
    Click Element    //img[@onclick='document.AtPublicoPpalForm.irAccionAtPublico.click();']
    Sleep    15s
