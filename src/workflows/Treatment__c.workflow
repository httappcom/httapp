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
        <fullName>MQ Stage</fullName>
        <actions>
            <name>Fill_out_MQ</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
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
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>New</value>
        </criteriaItems>
        <description>Workflow rule to fire when a new treatment is created</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Restage to At Provider</fullName>
        <actions>
            <name>Stage_to_At_Provider</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Substage_to_treatment_in_progess</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>[[Note: Currently using &quot;Preferred Travel Date From&quot; because Arrival Date is not yet an available field]] When arrival date = current date (unless stage is already &quot;At Provider&quot;) change stage to &quot;At Provider&quot;  and substage to Treatment in Progress.</description>
        <formula>AND(NOT(ISPICKVAL(Stage__c, &quot;At Provider&quot;)),  Preferred_Travel_Date_From__c  =  TODAY()  )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Travel Converted restaging</fullName>
        <actions>
            <name>Rephase_to_Treatment</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Restage_to_Travel_Itinerary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>When treatment staged in &quot;Travel Converted&quot;, change treatment Phase to &quot;(3) Travel&quot;</description>
        <formula>AND( ISPICKVAL( Phase__c , &quot;(2) Interaction&quot;), ISPICKVAL( Stage__c , &quot;Travel Converted&quot;)  )</formula>
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
