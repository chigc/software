<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>   
    <pattern>
        <rule context="tei:idno[@type='PID']/text()">
            <assert test="starts-with(., 'o:chigc.')"> The ID of the manuscript has to start with 'o:chigc.'</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:p/tei:persName"> <!-- ???? --> 
            <assert test="matches(text(), '[A-Z]+')">Enter the initials of the person responsible. If the person is unknown, enter NN. </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="@rend"> <!-- ???? --> 
            <assert test="matches(., 'present|not-present')">Choose Yes or No.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:locus/@from"> <!-- ???? --> 
            <assert test="matches(., '[1-9] | \?')">Insert the Folionumber, where the Item starts, or delete the section.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:locus/@to"> <!-- ???? --> 
            <assert test="matches(., '[1-9] | \?')">Insert the Folionumber, where the Item ends, or delete the section.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:incipit"> <!-- ???? --> 
            <assert test="matches(text(), '[A-Z] | \[Missing\]')">Insert the Incipit text or [Missing]. </assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:msItem/@corresp"> <!-- ???? --> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="item/@corresp"> <!-- ???? --> 
            <assert test="contains(., '#')">Choose the respective superstructure ID</assert>
        </rule>
    </pattern>
</sch:schema>