<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Post_Op_30day_Final_Email</fullName>
        <description>Post Op 30day Final Email</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Post_Op_30_day_Final_Email</template>
    </alerts>
    <alerts>
        <fullName>Post_Treatment_Welcome_Home</fullName>
        <description>Post Treatment Welcome Home</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Post_Treatment_Welcome_Home</template>
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
    <alerts>
        <fullName>Treatment_Itinerary_Email_to_Patient</fullName>
        <description>Treatment Itinerary Email to Patient</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Itinerary_Available</template>
    </alerts>
    <fieldUpdates>
        <fullName>At_Provider</fullName>
        <field>Stage__c</field>
        <literalValue>At Provider</literalValue>
        <name>At Provider</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
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
        <fullName>Initialize_Treatment</fullName>
        <field>Stage__c</field>
        <literalValue>New</literalValue>
        <name>Initialize Treatment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Intialize_Travel_Phase</fullName>
        <field>Stage__c</field>
        <literalValue>Travel Itinerary</literalValue>
        <name>Intialize Travel Phase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
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
        <fullName>Set_Initialize_Travel_Sub_Stage</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Trip Preparation</literalValue>
        <name>Set Initialize Travel Sub Stage</name>
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
        <fullName>Sub_stage_to_Quote_in_Process</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Quote In Process</literalValue>
        <name>Set Sub-stage to Quote in Process</name>
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
    <fieldUpdates>
        <fullName>Treatment_in_progress</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Treatment In Progress</literalValue>
        <name>Treatment-in-progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>At Provider Now</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>(3) Travel</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>At_Provider</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>Treatment_in_progress</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>In_market_phone_call</name>
                <type>Task</type>
            </actions>
            <offsetFromField>Treatment__c.Arrival_Time__c</offsetFromField>
            <timeLength>-1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Itinerary Available</fullName>
        <actions>
            <name>Treatment_Itinerary_Email_to_Patient</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Treatment Itinerary Available</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>New Treatment</fullName>
        <actions>
            <name>Thank_You_New_Treatment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Initialize_Treatment</name>
            <type>FieldUpdate</type>
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
        <fullName>Post Treatment Workflow</fullName>
        <active>true</active>
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
                <name>Post_Treatment_Medical_Checkin</name>
                <type>Task</type>
            </actions>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Post_Op_30day_Final_Email</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Post_Treatment_Welcome_Home</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Relationship Terminated</fullName>
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
        <fullName>Send Quote to EchoSign</fullName>
        <actions>
            <name>Sub_stage_to_Quote_in_Process</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Quote Complete - Send to Echosign</value>
        </criteriaItems>
        <description>Sends the quote document as a PDF to EchoSign for the patient to sign.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Travel Itinerary Stage</fullName>
        <actions>
            <name>Intialize_Travel_Phase</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Initialize_Travel_Sub_Stage</name>
            <type>FieldUpdate</type>
        </actions>
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
        <fullName>In_market_phone_call</fullName>
        <assignedToType>owner</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Treatment__c.Arrival_Time__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>In market phone call</subject>
    </tasks>
    <tasks>
        <fullName>Post_Treatment_Medical_Checkin</fullName>
        <assignedTo>Medical_Information_Officers</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Post Treatment Medical Checkin</subject>
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
