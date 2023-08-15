<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Testing_Snapshot_Diff</fullName>
        <description>Testing Snapshot Diff</description>
        <protected>false</protected>
        <recipients>
            <recipient>shaunakcopado@copado.com.devone</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SchedulerUnauthenticatedUserAppointmentTypeEmailTemplateForAmazonChime</template>
    </alerts>
    <rules>
        <fullName>Testing Snapshot Diff</fullName>
        <actions>
            <name>Test</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>equals</operation>
            <value>Shaunak</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Test</fullName>
        <assignedToType>owner</assignedToType>
        <description>Testing</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Test</subject>
    </tasks>
</Workflow>