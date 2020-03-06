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
${ContadorTribunalOrigen}    0

*** Test Cases ***
Test1
    Open Browser    ${Url}    chrome
    Sleep    15s
    Select Frame    name=body
    Sleep    15s
    Click Element    //td[contains(@id,'tdCuatro')]
    Sleep    15s
    clipboard.Copy    CONTRERAS
    Input Text    //input[contains(@name,'NOM_Consulta')]    GASPAR
    Input Text    //input[contains(@name,'APE_Paterno')]    SALAS
    Click Element    //input[contains(@name,'APE_Materno')]
    Press Keys    none    CTRL+V
    Select From List By Value    name:COD_TribunalSinTodos    1349
    Click Element    //img[@onclick='document.AtPublicoPpalForm.irAccionAtPublico.click();']
    Sleep    15s
    Close Browser

*** Keywords ***
AumentadorDeTribunalOrigen
    ${temp2}    Evaluate    ${ContadorTribunalOrigen}+1
    Set Test Variable    ${ContadorTribunalOrigen}    ${temp2}
