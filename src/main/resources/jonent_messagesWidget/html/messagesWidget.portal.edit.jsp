<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>

<template:addResources type="javascript" resources="messages-app.js"/>

<script type="text/javascript">
    $(document).ready(function(){
        angular.bootstrap(document.getElementById("messages-widget-${currentNode.identifier}"), ['messagesWidgetApp']);
    });
</script>

<div ng-app="messagesWidgetApp">
    <div id="messages-widget-${currentNode.identifier}" ng-controller="messages-edit-ctrl"
         widget-injector="{'widgetId': 'messages-widget-${currentNode.identifier}'}"
         widget="widget">

        <h2>Edit message widget:</h2>

        <form>
            <label>
                <span>Title :</span>
                <input type="text" name="jcr:title" value="${currentNode.displayableName}">
            </label>

            <label>
                <span>Channel :</span>
                <input type="text" name="channelName" value="${currentNode.properties.channelName.string}"/>
            </label>

            <button ng-click="cancel()">Cancel</button>
            <button ng-click="update()">Save</button>
        </form>
    </div>
</div>
