<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:addResources type="javascript" resources="messages-app.js"/>

<script type="text/javascript">
    $(document).ready(function(){
        angular.bootstrap(document.getElementById("messages-widget-${currentNode.identifier}"), ['messagesWidgetApp']);
    });
</script>

<div ng-app="messagesWidgetApp">
    <div id="messages-widget-${currentNode.identifier}" ng-controller="messages-ctrl"
         widget-injector="{'widgetId': 'messages-widget-${currentNode.identifier}', 'room': '${currentNode.properties.room.string}'}"
         widget="widget" room="room">

        <ul>
            <li ng-repeat="message in messages"><strong>{{message.properties.author.value}}</strong>: {{message.properties.body.value}}</li>
        </ul>

        <textarea ng-model="newMessage"></textarea>

        <button ng-click="submit()">Submit</button>
    </div>
</div>