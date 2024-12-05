<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>   
    <!-- Essentials --> 
    <pattern>
        <rule context="tei:idno[@type='PID']/text()">
            <assert test="starts-with(., 'o:chigc.')"> The ID of the manuscript has to start with 'o:chigc.'</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:item/@rend"> 
            <assert test="matches(., 'yes|no')">Choose Yes or No.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:locus/@from">
            <assert test="matches(., '(\d+v?)|(\d+r?)|(\?)')">Insert the Folionumber, where the Item starts, or delete the section.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:locus/@to">
            <assert test="matches(., '(\d+v?)|(\d+r?)|(\?)')">Insert the Folionumber, where the Item ends, or delete the section.</assert>
        </rule>
    </pattern>
    <!--- ID Warnings --> 
    <pattern>
        <rule context="tei:msItem[@rend='yes']/@corresp"> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[@n='co-transmission']/@corresp"> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[@n='transmission-context']/@corresp"> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:item[@rend='present']/@corresp"> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:repository/@corresp"> 
            <assert test="contains(., '#')">Choose the respective Archive ID for the repository. You can find a list at http://gams-staging.uni-graz.at/o:chigc.listarchives </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:item[not(ancestor::tei:surrogates)]/@corresp"> 
            <assert test="contains(., '#')">Choose the respective superstructure ID. </assert>
        </rule>
    </pattern>
    <!-- Additionals --> 
    <!--Datecheck-->
    <pattern>
        <rule context="tei:date/@notBefore"> 
            <assert test="matches(., '\d{4}')">Fill in a correct date (form: 0000) or delete the section. For references on how to write date-ranges see the CHIGC-Wiki on Github. </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:date/@notAfter"> 
            <assert test="matches(., '\d{4}')">Fill in a correct date (form: 0000) or delete the section. For references on how to write date-ranges see the CHIGC-Wiki on Github. </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:date/@when"> 
            <assert test="matches(., '\d{4}')">Fill in a correct date (form: 0000) or delete the section. For references on how to write date-ranges see the CHIGC-Wiki on Github. </assert>
        </rule>
    </pattern>
    <!-- Responsibility Check --> 
    <pattern>
        <rule context="tei:p/tei:persName"> 
            <assert test="matches(text(), '[A-Z]+')">Enter the initials of the person responsible. If the person is unknown, enter NN. </assert>
        </rule>
    </pattern>
    <!-- Link check --> 
    <pattern>
        <rule context="tei:surrogates/tei:list/tei:item/@corresp"> 
            <assert test="contains(., 'http')">Add a link or delete the section.</assert>
        </rule>
    </pattern>
    <!-- measurements -->  
    <pattern>
        <rule context="tei:height"> 
            <assert test="matches(., '\d+mm')">Fill in the height of the manuscript (number + mm without whitespace, e.g. 200mm) or delete the section. </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:width"> 
            <assert test="matches(., '\d+mm')">Fill in the width of the manuscript (number + mm without whitespace, e.g. 200mm) or delete the section.</assert>
        </rule>
    </pattern>
    <!-- Incipit, condition, date on oPublication flag --> 
    <pattern>
        <rule context="tei:incipit"> 
            <assert test="matches(text(), '[A-z]+' )">Insert the Incipit text or [Missing]. </assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:condition/@n"> 
            <assert test="matches(., '(fragmentory)|(complete)|(incomplete)|(unclear)')">Select the condition of the manuscript from the drop-down</assert>
        </rule>
    </pattern>
    
    <pattern>
        <rule context="tei:change[@n='readyForPublication']/@when"> 
            <assert test="contains(., '20')">Select a date.</assert>
        </rule>
    </pattern>
    <!-- Version rules --> 
    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '1']">
            <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'GB6') or contains(tei:note[@type='msGroup']/@n, 'FR1') or contains(tei:note[@type='msGroup']/@n, 'FR2') or contains(tei:note[@type='msGroup']/@n, 'BE1') or contains(tei:note[@type='msGroup']/@n, 'GB1') or contains(tei:note[@type='msGroup']/@n, 'GB3') or contains(tei:note[@type='msGroup']/@n, 'GB5') or contains(tei:note[@type='msGroup']/@n, 'AT1') or contains(tei:note[@type='msGroup']/@n, 'AT2') or contains(tei:note[@type='msGroup']/@n, 'ES1') or contains(tei:note[@type='msGroup']/@n, 'IT1') or contains(., 'DE1') or contains(tei:note[@type='msGroup']/@n, 'DE2') or contains(tei:note[@type='msGroup']/@n, 'DE3') or contains(tei:note[@type='msGroup']/@n, 'DE4') or contains(tei:note[@type='msGroup']/@n, 'DE5')) and tei:note[@type='graphversion']/@n = '1'">
                Wrong subgroup chosen. You selected Version 1, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
            </assert>
            
        </rule>
    </pattern>


    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '2']">
        <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'CH2') or contains(tei:note[@type='msGroup']/@n, 'FR3') or contains(tei:note[@type='msGroup']/@n, 'FR4') or contains(tei:note[@type='msGroup']/@n, 'FR5') or contains(tei:note[@type='msGroup']/@n, 'GB4') or contains(tei:note[@type='msGroup']/@n, 'AT3')) and tei:note[@type='graphversion']/@n = '2'">
        Wrong subgroup chosen. You selected Version 2, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
    </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '3']">
            <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'GB2')) and tei:note[@type='graphversion']/@n = '3'">
                Wrong subgroup chosen. You selected Version 3, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '4']">
            <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'CH1')) and tei:note[@type='graphversion']/@n = '4'">
                Wrong subgroup chosen. You selected Version 4, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '5']">
            <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'IT2')) and tei:note[@type='graphversion']/@n = '5'">
                Wrong subgroup chosen. You selected Version 5, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
            </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem[1][tei:note[@type='graphversion']/@n = '6']">
            <assert test="(tei:note[@type='msGroup']/@n = '' or contains(tei:note[@type='msGroup']/@n, 'NL1')) and tei:note[@type='graphversion']/@n = '6'">
                Wrong subgroup chosen. You selected Version 3, the chosen subgroup does not belong to this grouping. Check the Manuscript Graphversion and the Manuscript Sub-Group fields.
            </assert>
        </rule>
    </pattern>
    
   
</sch:schema>