function cargarVista(event, vista) {
    event.preventDefault();

    document.querySelectorAll('.profile-sidebar a')
        .forEach(a => a.classList.remove('active'));

    event.target.classList.add('active');

    const contexto = window.location.pathname.split('/')[1];

    const url = `/${contexto}/UsuarioController?op=cargarVista&vista=${vista}`;

    fetch(url)
        .then(res => res.text())
        .then(html => {
            document.getElementById("contenidoPerfil").innerHTML = html;
        })
        .catch(err => console.error(err));
}
