<ul>
    <li>
        <h3>
            <a href="#" class="user">Users</a>
        </h3>
        <ul>
            <li>
                <g:link class="group" controller="shiroUser" action="list">List
                Users</g:link>
            </li>
            <li>
                <g:link class="useradd" controller="shiroUser" action="create">Create
                User</g:link>
            </li>
        </ul>
    </li>
    <li>
        <h3>
            <a href="#" class="manage">Miscellaneous</a>
        </h3>
        <ul class="navlist">
            <li>
                <g:link class="invoices" controller="configSetting" action="list">
                Settings</g:link>
            </li>
            <li>
                <g:link controller="configSetting" action="testDataRequest">Load Test
                Data</g:link>
            </li>
        </ul>
    </li>
</ul>
