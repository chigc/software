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
        <rule context="@rend"> 
            <assert test="matches(., 'present|not-present')">Choose Yes or No.</assert>
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
        <rule context="tei:msItem[@rend='present']/@corresp"> 
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

   
</sch:schema>