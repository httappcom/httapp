<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Email_Introducing_Travel_Concierge_Services</fullName>
        <description>Email: Introducing Travel Concierge Services</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Introducing_Travel_Concierge_Services</template>
    </alerts>
    <alerts>
        <fullName>Email_Patient_Check_in</fullName>
        <description>Email Patient Check-in</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Patient_Checkin</template>
    </alerts>
    <alerts>
        <fullName>Email_Patient_Checkin</fullName>
        <description>Email: Patient Checkin</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Patient_Checkin</template>
    </alerts>
    <alerts>
        <fullName>Email_Share_Your_Medical_Travel_Story</fullName>
        <description>Email Share Your Medical Travel Story</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Share_Your_Medical_Travel_Story</template>
    </alerts>
    <alerts>
        <fullName>Email_Welcome_Home</fullName>
        <description>Email: Welcome Home</description>
        <protected>false</protected>
        <recipients>
            <field>Patient_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Nuehealth_PRM/Welcome_Home</template>
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
        <template>Nuehealth_PRM/Received_Medical_Travel_Inquiry</template>
    </alerts>
    <fieldUpdates>
        <fullName>Admission</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Admissions</literalValue>
        <name>Admission</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>At_Provider</fullName>
        <field>Stage__c</field>
        <literalValue>At Provider</literalValue>
        <name>At Provider</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Attach_Surgical_Report_Task</fullName>
        <field>Task_Specifiers__c</field>
        <formula>&apos;Attach Surgical Report&apos;</formula>
        <name>Attach Surgical Report Task</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Cash_to_PostOp</fullName>
        <field>Phase__c</field>
        <literalValue>Post-Op</literalValue>
        <name>Cash to PostOp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Clear_SubStage_3</fullName>
        <field>Sub_Stage__c</field>
        <name>Clear SubStage 3</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Goto_Interaction_Phase</fullName>
        <field>Phase__c</field>
        <literalValue>Interaction</literalValue>
        <name>Goto Interaction Phase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Goto_Med_Info_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Medical Information</literalValue>
        <name>Goto Med Info Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>In_Market_Phone_Call</fullName>
        <field>Task_Specifiers__c</field>
        <formula>&apos;Final_Departure_Date__c&apos;</formula>
        <name>In Market Phone Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Init_Phase_Inquiry</fullName>
        <field>Phase__c</field>
        <literalValue>Inquiry</literalValue>
        <name>Init Phase Inquiry</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Init_Rehab_in_progress</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Rehab in Progress</literalValue>
        <name>Init Rehab-in-progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Init_Treatment_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>New</literalValue>
        <name>Init Treatment Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Intialize_Travel_Phase</fullName>
        <field>Stage__c</field>
        <literalValue>Itinerary</literalValue>
        <name>Intialize Travel Phase</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Phase_to_Travel</fullName>
        <field>Phase__c</field>
        <literalValue>Travel</literalValue>
        <name>Phase to Travel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Approval_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Treatment Approval</literalValue>
        <name>Set Approval Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Initialize_Travel_Sub_Stage</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Trip Preparation</literalValue>
        <name>Set Initialize Travel Sub Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Signed_to_Travel</fullName>
        <field>Phase__c</field>
        <literalValue>Travel</literalValue>
        <name>Signed to Travel</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_to_Itinerary</fullName>
        <field>Stage__c</field>
        <literalValue>Itinerary</literalValue>
        <name>Stage to Itinerary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Stage_to_Itinerary_2</fullName>
        <field>Stage__c</field>
        <literalValue>Itinerary</literalValue>
        <name>Stage to Itinerary 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Start_Itinerary</fullName>
        <field>Task_Specifiers__c</field>
        <formula>&apos;Pre-arrival Call; Itinerary Prep; Initial Travel Call&apos;</formula>
        <name>Start Itinerary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStage_to_Trip_Prep</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Trip Preparation</literalValue>
        <name>SubStage to Trip Prep</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SubStage_to_Trip_Prep_2</fullName>
        <field>Sub_Stage__c</field>
        <literalValue>Trip Preparation</literalValue>
        <name>SubStage to Trip Prep 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Surgical_Report_Reminder</fullName>
        <field>Task_Specifiers__c</field>
        <formula>&apos;Surgical Report Reminder&apos;</formula>
        <name>Surgical Report Reminder</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>To_Closed_Claim_Pending</fullName>
        <field>Stage__c</field>
        <literalValue>Treatment Closed-Claim Pending</literalValue>
        <name>To Closed Claim Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>To_PostOp</fullName>
        <field>Phase__c</field>
        <literalValue>Post-Op</literalValue>
        <name>To PostOp</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>To_Quoting_Stage</fullName>
        <field>Stage__c</field>
        <literalValue>Quoting</literalValue>
        <name>To Quoting Stage</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>To_Rel_Marketing</fullName>
        <field>Stage__c</field>
        <literalValue>Relationship Marketing</literalValue>
        <name>To Rel Marketing</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>01 Init Treatment Phase%2FStage</fullName>
        <actions>
            <name>Init_Phase_Inquiry</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Init_Treatment_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR (2 AND 3)</booleanFilter>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Inquiry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>02 New Treatment</fullName>
        <actions>
            <name>Thank_You_New_Treatment</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Inquiry</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Patient_Email__c</field>
            <operation>notEqual</operation>
            <value>Null</value>
        </criteriaItems>
        <description>Workflow rule to fire when a new treatment is created</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>03 Consult Med Info Check</fullName>
        <actions>
            <name>Phase_to_Travel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_to_Itinerary</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubStage_to_Trip_Prep</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2 AND ((NOT 3 OR 4) AND (NOT 5 OR 6))</booleanFilter>
        <criteriaItems>
            <field>Treatment__c.Engagement_Type__c</field>
            <operation>equals</operation>
            <value>Consult</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Medical Information</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Profile_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Profile_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Records_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Records_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>04 Treatment Med Info Check</fullName>
        <actions>
            <name>Set_Approval_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>7 AND 1 AND 2 AND ((NOT 3 OR 4) AND (NOT 5 OR 6))</booleanFilter>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Interaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Medical Information</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Profile_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Profile_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Records_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Medical_Records_Received__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Engagement_Type__c</field>
            <operation>equals</operation>
            <value>Treatment</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>05 Treatment Approval Stage</fullName>
        <actions>
            <name>To_Quoting_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Interaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Treatment Approval</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Approval_State__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>06 Signed Quote</fullName>
        <actions>
            <name>Signed_to_Travel</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Stage_to_Itinerary_2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>SubStage_to_Trip_Prep_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Interaction</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Quoting</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Quote_Status__c</field>
            <operation>equals</operation>
            <value>Quote Signed</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>07 Travel Itinerary Stage</fullName>
        <actions>
            <name>Intialize_Travel_Phase</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Set_Initialize_Travel_Sub_Stage</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <description>WF fires when the treatment enters Travel Itinerary Stage</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>08 Travel Phase Email</fullName>
        <actions>
            <name>Email_Introducing_Travel_Concierge_Services</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Itinerary</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Trip Preparation</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>09 Itinerary Tasks</fullName>
        <actions>
            <name>Start_Itinerary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Itinerary</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Arrival_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>10 At Provider Now</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>Itinerary</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Final_Departure_Date__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Arrival_Time__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Admission</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>At_Provider</name>
                <type>FieldUpdate</type>
            </actions>
            <actions>
                <name>In_Market_Phone_Call</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Treatment__c.Arrival_Time__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>11 At Provider Surgical Report</fullName>
        <actions>
            <name>Attach_Surgical_Report_Task</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>At Provider</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>12 Follow-up Program</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Treatment In Progress</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Email_Share_Your_Medical_Travel_Story</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>30</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Email_Patient_Check_in</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Email_Welcome_Home</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>13 Cash Reconcile and Release</fullName>
        <actions>
            <name>Cash_to_PostOp</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>To_Rel_Marketing</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Payment_Type__c</field>
            <operation>equals</operation>
            <value>Paying Cash</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>At Provider</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Reconcile and Release</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>14 Insurance Reconcile and Release</fullName>
        <actions>
            <name>Clear_SubStage_3</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>To_Closed_Claim_Pending</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>To_PostOp</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Travel</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>At Provider</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
            <value>Reconcile and Release</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Payment_Type__c</field>
            <operation>equals</operation>
            <value>Insurance</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>15 Surgical Report Reminder</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Post-Op</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Surgical_Report_Attached__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Surgical_Report_Reminder</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Treatment__c.Final_Departure_Date__c</offsetFromField>
            <timeLength>8</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>16 In-Market Rehab</fullName>
        <actions>
            <name>Init_Rehab_in_progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Treatment__c.Phase__c</field>
            <operation>equals</operation>
            <value>Post-Op</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Stage__c</field>
            <operation>equals</operation>
            <value>In-market Rehab</value>
        </criteriaItems>
        <criteriaItems>
            <field>Treatment__c.Sub_Stage__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
