<%@page import="Beans.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath() + "/img/";
    String url = request.getContextPath() + "/";
    
    Usuario usuario = (Usuario) request.getAttribute("usuario");
    String avatarActual = (usuario != null && usuario.getAvatar() != null) ? usuario.getAvatar() : "default.jpg";
%>

<form action="UsuarioController" method="POST">
    <input type="hidden" name="op" value="actualizarAvatar">
    <input type="hidden" name="avatarSeleccionado" id="inputAvatar" value="<%= avatarActual %>">

    <div class="avatar-page">
        <h2 class="section-title">Avatar</h2>
        <p class="section-subtitle">Elige la imagen de tu avatar.</p>

        <div class="avatar-top">
            <div class="avatar-preview">
                <div class="avatar-frame">
                    <img src="<%= path + avatarActual %>" id="mainPreview">
                </div>

                <div class="avatar-sizes">
                    <div class="size-box">
                        <img src="<%= path + avatarActual %>" id="preview64">
                        <span>64px</span>
                    </div>
                    <div class="size-box2">
                        <img src="<%= path + avatarActual %>" id="preview32">
                        <span>32px</span>
                    </div>
                </div>
            </div>

            <div class="avatar-upload">
                <button type="button" class="btn-secondary">Sube tu avatar</button>
                <p>Sube un archivo desde tu dispositivo.</p>
            </div>
        </div>

        <div class="avatar-section">
            <h3>Tus avatares</h3>
            <div class="avatar-carousel">
                <%-- Avatares rápidos --%>
                <div class="avatar-thumb" onclick="cambiarAvatar('avatar1.jpg')">
                    <img src="<%= path %>avatar1.jpg">
                </div>
                <div class="avatar-thumb" onclick="cambiarAvatar('avatar2.jpg')">
                    <img src="<%= path %>avatar2.jpg">
                </div>
                <div class="avatar-thumb" onclick="cambiarAvatar('avatar3.jpg')">
                    <img src="<%= path %>avatar3.jpg">
                </div>
            </div>
            <%-- El modal de Bootstrap requiere que el JS del padre esté atento --%>
            <button type="button" class="btn-link" data-bs-toggle="modal" data-bs-target="#modalAvatares">Ver todos</button>
        </div>

        <div class="avatar-actions">
            
            <button type="submit" class="btn-primary">Guardar</button>
        </div>
    </div>
</form>

<div class="modal fade" id="modalAvatares" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content bg-dark text-light">
      <div class="modal-header border-secondary">
        <h5 class="modal-title">Todos los Avatares</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="d-flex flex-wrap gap-3">
            <% for(int i=1; i<=6; i++) { %>
                <div class="avatar-thumb" onclick="cambiarAvatar('avatar<%=i%>.jpg')" data-bs-dismiss="modal">
                    <img src="<%= path %>avatar<%=i%>.jpg">
                </div>
            <% } %>
        </div>
      </div>
    </div>
  </div>
</div>