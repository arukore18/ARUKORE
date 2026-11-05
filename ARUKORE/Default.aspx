<%@ Page Title="ARU KORE | Developer & Creator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ARUKORE.Default" %>

<asp:Content ID="HeadArea" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="description" content="Arun Kore — software developer and content creator." />
</asp:Content>
<asp:Content ID="BodyArea" ContentPlaceHolderID="MainContent" runat="server">
    <section class="hero">
        <p class="eyebrow">DEVELOPER · CREATOR · DREAMER</p>
        <h1>Turning ideas<br />
            into <span>reality.</span></h1>
        <p class="intro">Hey, I'm <strong>Arun Kore</strong> — a Junior Software Engineer who enjoys building digital experiences and capturing real-life moments.</p>
        <div class="actions">
            <a class="btn-primary" href="#projects">Explore my work ↓</a>
            <a class="text-link" href="Contact.aspx">Let's connect ↗</a>
        </div>
        <p class="location-line">BASED IN INDIA &nbsp; · &nbsp; BUILDING MY NEXT CHAPTER</p>
    </section>

    <section class="section-block" id="about">
        <p class="eyebrow">01 / ABOUT ME</p>
        <h2>One person.<br />
            <span class="muted">Many passions.</span></h2>
        <p class="section-copy">I'm an MCA graduate and Junior Software Engineer. I enjoy learning new technologies, solving problems, creating content and exploring new places.</p>
    </section>

    <section class="section-block" id="skills">
        <p class="eyebrow">02 / MY TOOLKIT</p>
        <h2>Skills & technologies.</h2>
        <asp:Label ID="lblDbStatus" runat="server" CssClass="validation" EnableViewState="false" />
        <div class="tag-list">
            <asp:Repeater ID="rptSkills" runat="server">
                <ItemTemplate>
                    <span class="tag"><%#: Eval("SkillName") %></span>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section class="section-block" id="projects">
        <p class="eyebrow">03 / SELECTED WORK</p>
        <h2>Things I've <span>built.</span></h2>
        <div class="project-grid">
            <asp:Repeater ID="rptProjects" runat="server">
                <ItemTemplate>
                    <article class="project-card">
                        <p class="eyebrow"><%#: Eval("ProjectType") %></p>
                        <h3><%#: Eval("ProjectName") %></h3>
                        <p><%#: Eval("ShortDescription") %></p>
                        <p class="tech-line"><%#: Eval("Technologies") %></p>
                    </article>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <section class="section-block creator-block">
        <p class="eyebrow">04 / THE CREATOR SIDE</p>
        <h2>Life is a story.<br />
            <span>I capture it.</span></h2>
        <p class="section-copy">Through ARU KORE, I share everyday moments, rides, places and experiences. More than code, creativity is part of my journey.</p>
        <a href="https://www.instagram.com/aru__kore/"
            target="_blank"
            rel="noopener noreferrer"
            class="creator-instagram-link">Find me on Instagram ↗
        </a>

    </section>
</asp:Content>
