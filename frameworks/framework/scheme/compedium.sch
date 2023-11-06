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
        <rule context="tei:change[@n='manuscriptRecord']/@when"> <!-- ???? --> 
            <assert test="format-date(., '[Y]-[M,2]-[D,2]')"> The ID of the manuscript has to start with 'o:chigc.'</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="tei:change[@n='manuscriptRecord']/persName"> <!-- ???? --> 
            <assert test=". != ''"> The ID of the manuscript has to start with 'o:chigc.'</assert>
        </rule>
    </pattern>
</sch:schema>