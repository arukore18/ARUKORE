
<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="ARUKORE.Default" %>

<asp:Content ID="HeadSection" ContentPlaceHolderID="HeadContent" runat="server">

    <!-- HOMEPAGE SEO -->
    <meta name="description"
          content="Welcome to ARU KORE - the personal portfolio of Arun Kore, Junior Software Engineer, developer and content creator. Explore my skills, projects and creative journey." />

    <meta name="keywords"
          content="Arun Kore, ARU KORE, Software Engineer, Junior Software Developer, MCA Graduate, Web Developer, Portfolio, Content Creator" />

    <meta name="author" content="Arun Kore" />

    <meta name="robots" content="index, follow" />

    <link rel="canonical" href="https://arukore.in/" />

    <!-- OPEN GRAPH / FACEBOOK / WHATSAPP / LINKEDIN -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="ARU KORE | Arun Kore - Software Engineer & Creator" />
    <meta property="og:description"
          content="Explore the portfolio, projects, skills and creative journey of Arun Kore." />
    <meta property="og:url" content="https://arukore.in/" />
    <meta property="og:site_name" content="ARU KORE" />
    <meta property="og:image"
          content="https://arukore.in/Content/images/aru-kore-social-preview.png" />
    <meta property="og:image:alt" content="ARU KORE - Arun Kore Personal Portfolio" />
    <meta property="og:image:type" content="image/png" />

    <!-- TWITTER / X -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="ARU KORE | Arun Kore" />
    <meta name="twitter:description"
          content="Software Engineer by work. Creator by passion. Explore my journey." />
    <meta name="twitter:image"
          content="https://arukore.in/Content/images/aru-kore-social-preview.png" />
    <meta name="twitter:image:alt" content="ARU KORE Personal Portfolio" />

    <!-- PROFILE IMAGE SIZE: 30% LARGER -->
    <style>
        .profile-slide img {
            transform: scale(1.3);
            transform-origin: center center;
        }
    </style>

    <script src="<%= ResolveUrl("~/Scripts/portfolio.js") %>" defer></script>

</asp:Content>


<asp:Content ID="MainSection" ContentPlaceHolderID="MainContent" runat="server">

    <!-- HERO SECTION -->
    <section class="hero-v2" id="home">

        <div class="hero-noise"></div>

        <div class="hero-inner">

            <div class="hero-copy">

                <div class="availability">
                    <span class="availability-dot"></span>
                    AVAILABLE FOR NEW OPPORTUNITIES
                </div>

                <p class="hero-eyebrow">HELLO THERE, I'M</p>

                <h1 class="hero-name">
                    ARUN
                    <span>KORE<span class="accent-dot">.</span></span>
                </h1>

                <h2 class="hero-role">
                    Junior Software
                    <span>Engineer.</span>
                </h2>

                <p class="hero-description">
                    I build digital experiences, develop useful applications
                    and turn ideas into working solutions. Always learning,
                    always creating, always moving forward.
                </p>

                <div class="hero-tags">
                    <span>Software Developer</span>
                    <span>Problem Solver</span>
                    <span>Content Creator</span>
                </div>

                <div class="hero-actions">
                    <a href="#projects" class="btn-primary">
                        EXPLORE MY WORK <span>↗</span>
                    </a>

                    <a href="Contact.aspx" class="btn-secondary">
                        LET'S CONNECT <span>↗</span>
                    </a>
                </div>

                <div class="hero-location">
                    <span>⌖</span>
                    BENGALURU, INDIA
                    <span class="location-divider">/</span>
                    OPEN TO LEARNING & GROWTH
                </div>

            </div>

            <!-- PROFILE IMAGE CAROUSEL -->
            <div class="hero-visual">

                <div class="visual-topline">
                    <span>THE PERSON BEHIND THE CODE</span>
                    <span>01 — 05</span>
                </div>

                <div class="profile-carousel" id="profileCarousel">

                    <div class="profile-track" id="profileTrack">

                        <div class="profile-slide active">
                            <img src="<%= ResolveUrl("~/Content/images/profile-1.jpeg") %>"
                                 alt="Arun Kore profile photograph" />
                            <span class="slide-number">01</span>
                        </div>

                        <div class="profile-slide">
                            <img src="<%= ResolveUrl("~/Content/images/profile-2.jpeg") %>"
                                 alt="Arun Kore portrait 2" />
                            <span class="slide-number">02</span>
                        </div>

                        <div class="profile-slide">
                            <img src="<%= ResolveUrl("~/Content/images/profile-3.jpeg") %>"
                                 alt="Arun Kore portrait 3" />
                            <span class="slide-number">03</span>
                        </div>

                        <div class="profile-slide">
                            <img src="<%= ResolveUrl("~/Content/images/profile-4.jpeg") %>"
                                 alt="Arun Kore portrait 4" />
                            <span class="slide-number">04</span>
                        </div>

                        <div class="profile-slide">
                            <img src="<%= ResolveUrl("~/Content/images/profile-5.jpeg") %>"
                                 alt="Arun Kore portrait 5" />
                            <span class="slide-number">05</span>
                        </div>

                    </div>

                </div>

                <div class="carousel-controls">

                    <button type="button" id="profilePrev"
                            aria-label="Previous profile image">←</button>

                    <div class="carousel-progress">
                        <span id="carouselCurrent">01</span>
                        <div class="progress-line">
                            <span id="carouselProgress"></span>
                        </div>
                        <span>05</span>
                    </div>

                    <button type="button" id="profileNext"
                            aria-label="Next profile image">→</button>

                </div>

                <div class="visual-caption">
                    <div>
                        <strong>ARU KORE</strong>
                        <span>Developer by work. Creator by passion.</span>
                    </div>
                    <span class="caption-symbol">✳</span>
                </div>

            </div>

        </div>

        <div class="hero-bottom-text">
            <span>CODE WITH PURPOSE</span>
            <span>✳</span>
            <span>CREATE WITH PASSION</span>
            <span>✳</span>
            <span>KEEP MOVING FORWARD</span>
        </div>

    </section>


    <!-- ABOUT SECTION -->
    <section class="section-v2 about-v2" id="about">

        <div class="section-heading">
            <span class="section-index">01 / ABOUT ME</span>
            <span class="section-line"></span>
        </div>

        <div class="about-layout">

            <div class="about-title">
                <p class="small-label">A LITTLE INTRODUCTION</p>

                <h2>
                    More than
                    <span>just code.</span>
                </h2>
            </div>

            <div class="about-content">

                <p class="about-highlight">
                    I'm Arun Kore — an MCA graduate and Junior Software
                    Engineer who enjoys building applications and learning
                    technologies that solve real problems.
                </p>

                <p>
                    My interests include backend development, web applications,
                    databases and exploring new technologies. Beyond my work,
                    I enjoy bike rides, travelling, capturing moments and
                    creating content through ARU KORE.
                </p>

                <a href="Contact.aspx" class="text-link">
                    LET'S KNOW EACH OTHER <span>↗</span>
                </a>

            </div>

        </div>

        <div class="about-stats">

            <div class="stat-item">
                <span class="stat-number">MCA</span>
                <span class="stat-label">EDUCATION</span>
            </div>

            <div class="stat-item">
                <span class="stat-number">2024</span>
                <span class="stat-label">GRADUATION</span>
            </div>

            <div class="stat-item">
                <span class="stat-number">01+</span>
                <span class="stat-label">YEAR OF LEARNING & BUILDING</span>
            </div>

            <div class="stat-item">
                <span class="stat-number">∞</span>
                <span class="stat-label">CURIOSITY</span>
            </div>

        </div>

    </section>


    <!-- SKILLS SECTION -->
    <section class="section-v2 skills-v2" id="skills">

        <div class="section-heading">
            <span class="section-index">02 / MY TOOLKIT</span>
            <span class="section-line"></span>
        </div>

        <div class="section-intro">
            <div>
                <p class="small-label">TECHNOLOGY & TOOLS</p>
                <h2>Things I work <span>with.</span></h2>
            </div>

            <p>
                Technologies I use to learn, develop and bring ideas to life.
            </p>
        </div>

        <div class="skill-grid premium-skill-grid">

            <asp:Repeater ID="rptSkills" runat="server">
                <ItemTemplate>
                    <div class="skill-card">
                        <span class="skill-symbol">✳</span>
                        <span class="skill-name"><%#: Eval("SkillName") %></span>
                        <span class="skill-arrow">↗</span>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>

        <asp:Label ID="lblDbStatus" runat="server"
                   CssClass="db-status" />

    </section>


    <!-- PROJECTS SECTION -->
    <section class="section-v2 projects-v2" id="projects">

        <div class="section-heading">
            <span class="section-index">03 / SELECTED WORK</span>
            <span class="section-line"></span>
        </div>

        <div class="section-intro">
            <div>
                <p class="small-label">MY DEVELOPMENT JOURNEY</p>
                <h2>Ideas into <span>reality.</span></h2>
            </div>

            <p>
                A collection of applications and projects built while
                exploring technologies and improving my development skills.
            </p>
        </div>

        <div class="project-grid premium-project-grid">

            <asp:Repeater ID="rptProjects" runat="server">
                <ItemTemplate>

                    <article class="project-card">

                        <div class="project-card-top">
                            <span class="project-type">
                                <%#: Eval("ProjectType") %>
                            </span>
                            <span class="project-arrow">↗</span>
                        </div>

                        <h3><%#: Eval("ProjectName") %></h3>

                        <p class="project-description">
                            <%#: Eval("ShortDescription") %>
                        </p>

                        <div class="project-tech">
                            <%#: Eval("Technologies") %>
                        </div>

                    </article>

                </ItemTemplate>
            </asp:Repeater>

        </div>

    </section>


    <!-- CREATOR SECTION -->
    <section class="section-v2 creator-v2" id="creator">

        <div class="creator-background-text">ARU KORE</div>

        <div class="creator-content">

            <span class="section-index">04 / BEYOND THE SCREEN</span>

            <p class="small-label">MY CREATIVE SIDE</p>

            <h2>
                Developer by work.
                <span>Creator by passion.</span>
            </h2>

            <p class="creator-description">
                Life is more than lines of code. Through ARU KORE,
                I share everyday moments, bike rides, travel experiences
                and my journey of becoming better every day.
            </p>

            <a href="https://www.instagram.com/aru__kore/"
               target="_blank"
               rel="noopener noreferrer"
               class="btn-primary">
                FOLLOW MY JOURNEY <span>↗</span>
            </a>

        </div>

    </section>


    <!-- CONTACT CTA -->
    <section class="section-v2 contact-cta-v2" id="contact">

        <div class="section-heading">
            <span class="section-index">05 / HAVE AN IDEA?</span>
            <span class="section-line"></span>
        </div>

        <div class="contact-cta-content">

            <p class="small-label">LET'S CREATE SOMETHING MEANINGFUL</p>

            <h2>
                Have a good idea?
                <span>Let's build it.</span>
            </h2>

            <p>
                Have an opportunity, project idea or just want to connect?
                I'm always happy to hear from you.
            </p>

            <a href="Contact.aspx" class="btn-primary">
                GET IN TOUCH <span>↗</span>
            </a>

        </div>

    </section>

</asp:Content>
