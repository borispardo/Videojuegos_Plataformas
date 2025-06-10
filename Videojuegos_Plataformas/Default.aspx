<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center my-5">
        <h1 class="display-4 fw-bold">🎮 Bienvenido al sistema</h1>
        <p class="lead mt-3 mb-4 text-secondary">
            Administra tus videojuegos, plataformas y asociaciones de forma sencilla.
        </p>
    </div>

    <div class="row g-4 justify-content-center">
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-lg rounded-4">
                <div class="card-body text-center">
                    <div class="display-6 mb-3">📋</div>
                    <h5 class="card-title fw-semibold">Videojuegos</h5>
                    <p class="card-text text-muted">Agrega, edita o elimina videojuegos de tu catálogo.</p>
                    <a href="Videojuegos.aspx" class="btn btn-outline-primary rounded-pill px-4">Ir a Videojuegos</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-lg rounded-4">
                <div class="card-body text-center">
                    <div class="display-6 mb-3">🕹️</div>
                    <h5 class="card-title fw-semibold">Plataformas</h5>
                    <p class="card-text text-muted">Gestiona plataformas como PS5, Xbox, PC, etc.</p>
                    <a href="Plataformas.aspx" class="btn btn-outline-success rounded-pill px-4">Ir a Plataformas</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-lg rounded-4">
                <div class="card-body text-center">
                    <div class="display-6 mb-3">🔗</div>
                    <h5 class="card-title fw-semibold">Asociaciones</h5>
                    <p class="card-text text-muted">Relaciona videojuegos con sus plataformas.</p>
                    <a href="VideojuegoPlataformas.aspx" class="btn btn-outline-warning rounded-pill px-4">Ir a Asociaciones</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
