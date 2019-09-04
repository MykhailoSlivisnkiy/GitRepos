<#assign
    known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user1 = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    >
<#else>
</#if>