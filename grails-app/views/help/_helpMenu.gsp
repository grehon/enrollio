<shiro:isLoggedIn>
<ul>
    <li>
        <h3>
            <g:link class="house" controller="home">Home</g:link>
        </h3>
        <ul>
            <li>
                <g:link class="shipping" controller="auth" action="signOut">Log
                Out</g:link>
            </li>
        </ul>
</ul>

        %{-- The remainder of this page are commented-out examples
            <li>
                <a href="#" class="report">Sales Report</a>
            </li>
            <li>
                <a href="#" class="report_seo">SEO Report</a>
            </li>
            <li>
                <a href="#" class="search">Search</a>
            </li>
        </ul>
    </li>
    <li>
        <h3>
            <a href="#" class="folder_table">Orders</a>
        </h3>
        <ul>
            <li>
                <a href="#" class="addorder">New order</a>
            </li>
            <li>
                <a href="#" class="shipping">Shipments</a>
            </li>
            <li>
                <a href="#" class="invoices">Invoices</a>
            </li>
        </ul>
    </li>
    <li>
        <h3>
            <a href="#" class="manage">Manage</a>
        </h3>
        <ul>
            <li>
                <a href="#" class="manage_page">Pages</a>
            </li>
            <li>
                <a href="#" class="cart">Products</a>
            </li>
            <li>
                <a href="#" class="folder">Product categories</a>
            </li>
            <li>
                <a href="#" class="promotions">Promotions</a>
            </li>
        </ul>
    </li>
    <li>
        <h3>
            <a href="#" class="user">Users</a>
        </h3>
        <ul>
            <li>
                <a href="#" class="useradd">Add user</a>
            </li>
            <li>
                <a href="#" class="group">User groups</a>
            </li>
            <li>
                <a href="#" class="search">Find user</a>
            </li>
            <li>
                <a href="#" class="online">Users online</a>
            </li>
        </ul>
    </li>
    --}%
</shiro:isLoggedIn>
