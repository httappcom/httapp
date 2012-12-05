<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Fill_out_MQ</fullName>
        <description>Fill out MQ</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Thank_You_MQ</template>
    </alerts>
    <alerts>
        <fullName>Thank_You_New_Treatment</fullName>
        <description>Thank You - New Treatment</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Thank_You_New_Treatment</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Phase_to_Travel</fullName>
        <field>Phase__c</field>
        <literalValue>(3) Travel</literalValue>
        <name>Change Phase to Travel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_phase_to_Interaction</fullName>
        <field>Phase__c</field>
        <literalValue>(2) Interaction</literalValue>
        <name>Change phase to &apos;Interaction&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Change_stage_to_Contact_Established</fullName>
        <field>Stage__c</field>
        <literalValue>Contact Established</literalValue>
        <name>Change stage to &apos;Contact Established&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_Stage</fullName>
        <field>Stage__c</field>
        <name>Clear Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_SubStage</fullName>
        <field>Sub_Stage__c</field>
        <name>Clear SubStage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Do_Not_Contact_Patient</fullName>
        <field>Do_Not_Contact__c</field>
        <literalValue>1</literalValue>
        <name>Do Not Contact Patient</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Patient__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Phase_to_Post_Op</fullName>
        <field>Phase__c</field>
        <literalValue>(4) Post-Op</literalValue>
        <name>Phase to Post Op</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Rephase_to_Treatment</fullName>
        <field>Phase__c</field>
        <literalValue>(3) Travel</literalValue>
        <name>Rephase to Treatment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Restage_to_Travel_Itinerary</fullName>
        <description>Set stage to Travel Itinerary</description>
        <field>Stage__c</field>
        <literalValue>Travel Itinerary</literalValue>
        <name>Restage to Travel Itinerary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_to_At_Provider</fullName>
        <description>Set Stage to &quot;At Provider&quot; and Sub-stage to &quot;Treatment in Progress&quot;</description>
        <field>Stage__c</field>
        <literalValue>At Provider</literalValue>
        <name>Stage to At Provider</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_to_Ongoing_Relationship</fullName>
        <field>Stage__c</field>
        <literalValue>Ongoing Relationship</literalValue>
        <name>Stage to Ongoing Relationship</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_to_Patient_Lost</fullName>
        <field>Stage__c</field>
        <literalValue>Patient Lost</literalValue>
        <name>Stage to Patient Lost</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Substage_to_treatment_in_progess</fullName>
        <description>Set substage to &quot;Treatment in Progress&quot;</description>
        <field>Sub_Stage__c</field>
        <literalValue>Treatment In Progress</literalValue>
        <name>Substage to Treatment in Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Contact Made</fullName>
        <actions>
            <name>Change_phase_to_Interaction</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Change_stage_to_Contact_Established</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Contact Made</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Interaction Lost</fullName>
        <actions>
            <name>Clear_SubStage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_to_Patient_Lost</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(2) Interaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Treatment Approval Requested</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>No Treatment</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>MQ Stage</fullName>
        <actions>
            <name>Fill_out_MQ</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Medical Information</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Treatment</fullName>
        <actions>
            <name>Thank_You_New_Treatment</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Workflow rule to fire when a new treatment is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Ongoing Relationship</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(4) Post-Op</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>notEqual</operation>
            <value>Relationship Terminated</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Stage_to_Ongoing_Relationship</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Relationship Terminated</fullName>
        <actions>
            <name>Do_Not_Contact_Patient</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Relationship Terminated</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(4) Post-Op</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Stage Travel Converted to Travel Phase</fullName>
        <actions>
            <name>Change_Phase_to_Travel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Clear_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Travel Converted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(2) Interaction</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Travel Itinerary Stage</fullName>
        <actions>
            <name>Call_Patient_48</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Call_Patient_Before_Departure</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Changes_Strategy</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Collect_Payment</name>
            <type>Task</type>
        </actions>
        <actions>
            <name>Start_Itinerary</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(3) Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Travel Itinerary</value>
        </criteriaItems>
        <description>WF fires when the treatment enters Travel Itinerary Stage</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Travel%3A Post Treatment to Post Op</fullName>
        <actions>
            <name>Clear_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Phase_to_Post_Op</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(3) Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Post-Treatment</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Call_Patient_48</fullName>
        <assignedToType>owner</assignedToType>
        <description>1. call patient within 48 hours (48 hour initial contact)</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call Patient 48</subject>
    </tasks>
    <tasks>
        <fullName>Call_Patient_Before_Departure</fullName>
        <assignedToType>owner</assignedToType>
        <description>3. call patient night before departure (pre-arrival call)</description>
        <dueDateOffset>-1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Call Patient Before Departure</subject>
    </tasks>
    <tasks>
        <fullName>Changes_Strategy</fullName>
        <assignedToType>owner</assignedToType>
        <description>5. Changes Strategy (update strategy to Travel Complete)</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Changes Strategy</subject>
    </tasks>
    <tasks>
        <fullName>Collect_Payment</fullName>
        <assignedToType>owner</assignedToType>
        <description>4. collect pay (payment collection)</description>
        <dueDateOffset>1</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Collect Payment</subject>
    </tasks>
    <tasks>
        <fullName>Start_Itinerary</fullName>
        <assignedToType>owner</assignedToType>
        <description>2. start itinerary (itinerary in progress)</description>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Start Itinerary</subject>
    </tasks>
</Workflow>
