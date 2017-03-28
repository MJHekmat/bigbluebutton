<#-- GET_RECORDINGS FreeMarker XML template -->
<response>
  <#-- Where code is a 'SUCCESS' or 'FAILED' String -->
  <returncode>${returnCode}</returncode>
  <meetingName>${meeting.getName()}</meetingName>
  <meetingID>${meeting.getExternalId()}</meetingID>
  <internalMeetingID>${meeting.getInternalId()}</internalMeetingID>
  <createTime>${meeting.getCreateTime()?c}</createTime>
  <createDate>${createdOn}</createDate>
  <voiceBridge>${meeting.getTelVoice()}</voiceBridge>
  <dialNumber>${meeting.getDialNumber()}</dialNumber>
  <attendeePW>${meeting.getViewerPassword()}</attendeePW>
  <moderatorPW>${meeting.getModeratorPassword()}</moderatorPW>
  <running>${meeting.isRunning()?c}</running>
  <duration>${meeting.getDuration()}</duration>
  <hasUserJoined>${meeting.hasUserJoined()?c}</hasUserJoined>
  <recording>${meeting.isRecord()?c}</recording>
  <hasBeenForciblyEnded>${meeting.isForciblyEnded()?c}</hasBeenForciblyEnded>
  <startTime>${meeting.getStartTime()?c}</startTime>
  <endTime>${meeting.getEndTime()}</endTime>
  <participantCount>${meeting.getNumUsers()}</participantCount>
  <listenerCount>${meeting.getNumListenOnly()}</listenerCount>
  <voiceParticipantCount>${meeting.getNumVoiceJoined()}</voiceParticipantCount>
  <videoCount>${meeting.getNumVideos()}</videoCount>
  <maxUsers>${meeting.getMaxUsers()}</maxUsers>
  <moderatorCount>${meeting.getNumModerators()}</moderatorCount>
  <attendees>
  <#list meeting.getUsers() as att>
    <attendee>
        <userID>${att.getInternalUserId()}</userID>
        <fullName>${att.getFullname()}</fullName>
        <role>${att.getRole()}</role>
        <isPresenter>${att.isPresenter()?c}</isPresenter>
        <isListeningOnly>${att.isListeningOnly()?c}</isListeningOnly>
        <hasJoinedVoice>${att.isVoiceJoined()?c}</hasJoinedVoice>
        <hasVideo>${att.hasVideo()?c}</hasVideo>
        <#if meeting.getUserCustomData(att.getExternalUserId())??>
            <#assign ucd = meeting.getUserCustomData(att.getExternalUserId())>
            <customdata>
                <#list ucd?keys as prop>
                    <${prop}><![CDATA[${ucd[prop]}]]></${prop}>
                </#list>
            </customdata>
        </#if>
    </attendee>
  </#list>
  </attendees>
  <#assign m = meeting.getMetadata()>
  <metadata>
  <#list m?keys as prop>
     <${prop}><![CDATA[${m[prop]}]]></${prop}>
  </#list>
  </metadata>

  <#if messageKey?has_content>
  <messageKey>${messageKey}</messageKey>
  </#if>

  <#if message?has_content>
  <message>${message}</message>
  </#if>

  <isBreakout>${meeting.isBreakout()?c}</isBreakout>

  <#if meeting.isBreakout()>
     <parentMeetingID>${meeting.getParentMeetingId()}</parentMeetingID>
     <sequence>${meeting.getSequence()}</sequence>
  </#if>

  <#list meeting.getBreakoutRooms()>
     <breakoutRooms>
     <#items as room>
        <breakout>${room}</breakout>
     </#items>
     </breakoutRooms>
  </#list>

</response>