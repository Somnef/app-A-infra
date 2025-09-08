<template>

    <div class="w-full mb-[3rem] flex flex-col items-center justify-center lg:items-start lg:justify-start">
        <div class="lg:text-5xl text-3xl font-semibold">Personal Projects</div>
        <div class="mt-[0.75rem] h-[1px] w-3/4 bg-middle-grey"></div>

        <div class="w-full flex flex-col items-center justify-center mt-[1rem] lg:mt-[2rem]">
            <div class="lg:w-2/3 w-full lg:text-xl text-sm text-middle-grey flex flex-row items-center justify-center gap-x-[1.5rem] lg:gap-x-[2rem] lg:gap-y-0 gap-y-[1rem]">
                <div @click="currentFilter = 'All'" :class="currentFilter === 'All' ? 'text-green-tech border-b border-green-tech' : ''" class="hover:cursor-pointer hover:text-green-tech transition-all ease-in-out duration-300">
                    All
                </div>
                <div @click="currentFilter = 'Cloud'" :class="currentFilter === 'Cloud' ? 'text-green-tech border-b border-green-tech' : ''" class="hover:cursor-pointer hover:text-green-tech transition-all ease-in-out duration-300">
                    Cloud
                </div>
                <div @click="currentFilter = 'Data'" :class="currentFilter === 'Data' ? 'text-green-tech border-b border-green-tech' : ''" class="hover:cursor-pointer hover:text-green-tech transition-all ease-in-out duration-300">
                    Data / AI
                </div>
                <div @click="currentFilter = 'Development'" :class="currentFilter === 'Development' ? 'text-green-tech border-b border-green-tech' : ''" class="hover:cursor-pointer hover:text-green-tech transition-all ease-in-out duration-300">
                    Development
                </div>
            </div>
        </div>

        <div class="w-full mt-[1rem] lg:text-base text-sm text-middle-grey grid lg:grid-cols-3 grid-cols-1 lg:gap-x-[1rem] lg:gap-y-[0.5rem] gap-x-[0.5rem] gap-y-[1rem] items-center">

            <ProjectCard v-for="project in projects" :key="project.id" :title="project.title" :type="project.type"
                :description="project.description" :techs="project.techs" :links="project.links" :image="project.image"
                :image2="project.image2" @projectClicked="emitProjectClicked" />

        </div>

        <div class="w-full mt-[1rem] lg:text-xl text-base text-light-grey">
            You can also check out my <a href="https://github.com/Somnef" target="_blank" class="underline text-green-tech hover:text-light-grey transition-all ease-in-out duration-300">GitHub</a> for more!
        </div>
    </div>

</template>

<script>
import ProjectCard from './ProjectCard.vue';

export default {
    components: {
        ProjectCard
    },

    emits: ['projectClicked'],

    data() {
        return {

            currentFilter: 'All',

            all_projects: [
                {
                    title: "AWS Infra with Terraform",
                    type: ["Cloud", "Development"],
                    description:
                        "Designed JADE agents to perform DDoS attacks on a server hosted on EC2 machines, capable of spawning over 20,000 instances in under 30 seconds.\
                        Deployed a scalable infrastructure using Terraform to mitigate intense attacks by maintaining CPU usage below 50%. Additionally, built a front-end\
                        application with VueJS and the AWS SDK to monitor CloudWatch metrics on the attacked servers.",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/d7001d-lab4"
                    },
                    techs: ["AWS", "Terraform", "VueJS", "Java"],
                    image: "images/projects/aws_terraform/aws_terraform.webp",
                    image2: "images/projects/aws_terraform/aws_terraform.webp",
                },
                {
                    title: "Kubernetes Fault Tolerance",
                    type: ["Cloud", "Development"],
                    description:
                        "Deployed a Python application on Docker containers orchestrated with Kubernetes' HPA based on CPU usage, allowing the system to scale \
                        for a load of 30%. Conducted stress-test attacks through infinite cURL request loops to evaluate the system's scalability and self-healing \
                        capabilities, achieving 99% availability. Leveraged Prometheus to monitor and analyze resource utilization in real-time.",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/kubernetes-fault-tolerance"
                    },
                    techs: ["Kubernetes", "Docker", "Prometheus", "Bash"],
                    image: "images/projects/kubernetes_fault_tolerance/kubernetes_fault_tolerance.png",
                    image2: "images/projects/kubernetes_fault_tolerance/kubernetes_fault_tolerance.png",
                },
                {
                    title: "Self-learning Snake agents",
                    description:
                        "In this project, I worked on writing my own version of the snake game, where I have control over all of what's happening,\
                        which then enabled me to write self-learning snake agents on top of it, the algorithm I used for these agents is called NEAT \
                        (Neuro-Evolution of Augmenting Topologies), which is quite popular when writing self-learning game-agents. The way this\
                        algorithm works is by mutating and combining very basic neural networks through an evolutionary approach.",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/snake_neat_ai",
                    }, 
                    type: ["Data", "Development"],
                    image: "images/projects/snake/snake.gif",
                    image2: "images/projects/snake/snake2.gif",
                    techs: ["Python", "Pygame", "Python-Neat"],
                },

                // Photo by Dennis Brendel on Unsplash
                {
                    title: "Wildfire spread prediction",
                    description:
                        "Along my team mates, we developed a solution which uses Google Earth's satellite imagery in order to reproduce real-life\
                        3D landscapes in Unity game engine (taking into account height, wind and vegetation data), and then predicts how wildfire\
                        would spread given an initial ignite position. By the end of the project, we were able to get a working simulation and\
                        publish our work on ResearchGate!",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/semi-empirical-wildfire-simulation",
                        "ResearchGate Article": "https://www.researchgate.net/publication/354678516_Applying_semi-empirical_simulation_of_wildfire_on_real_world_satellite_imagery_data",
                    }, 
                    type: ["Data", "Development"],
                    image: "images/projects/wildfire/wildfire.gif",
                    image2: "images/projects/wildfire/wildfire2.gif",
                    techs: ["Google Earth Engine's API", "Unity", "Python", "Scikit-learn"],
                },
                // Photo by Alessandra Caretto on Unsplash
                {
                    title: "Focus monitor",
                    type: ["Data", "Development"],
                    description:
                        "During the Google DevFest hackathon, me and my team worked on developing a focus monitor which follows the computer users'\
                        movements and facial features in order to determine whether they are focused or not, and produce a reliable data storage and\
                        monitoring tool regarding that person, but that I think about it, if we were to use that in corporations, it would be kinda\
                        scary, right ?!",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/focus-monitor-ai",
                    }, 
                    image: "images/projects/focus/focus.gif",
                    image2: "images/projects/focus/focus2.gif",
                    techs: ["Python", "Mediapipe", "OpenCV"],
                },

                {
                    title: "Algeria Told By Data",
                    type: ["Data"],
                    description:
                        "This side project I undertook with a group of friends consists of looking for Algerian data (historical, \
                        societal, economical... etc.), mining it through automatic tools (web scraping) and then try and put it in the best \
                        visual shape possible, which resulted in animations and visualizations which were quite explanatory.",
                    links: {
                        "GitHub Repo": "https://github.com/annis-souames/Algeria-told-by-data#contributing",
                    }, 
                    image: "images/projects/atbd/atbd.gif",
                    image2: "images/projects/atbd/atbd2.gif",
                    techs: ["Python", "Pandas", "Requests", "Selenium", "Matplotlib"],
                },

                {
                    title: "Convolutional autoencoder",
                    type: ["Data"],
                    description:
                        "This is a project I developed in the context of my Ericsson internship, it consisted of designing the structure\
                        of a convolutional neural network that acts as an autoencoder at the same time, and the decoder part is also trained on\
                        removing noise from input data.",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/denoising_convolutional_autoencoder",
                    }, 
                    image: "images/projects/denoiser/denoiser.webp",
                    image2: "images/projects/denoiser/denoiser.webp",
                    techs: ["Python", "Pytorch", "Matplotlib"],
                },

                {
                    title: "Dynamic market simulation",
                    type: ["Development"],
                    description:
                        "Development of a software simulating a competitive market where teams representing\
			            companies compete in production and sells of different products for the second edition of the IEC\
			            Business Game event..",
                    links: {
                        "GitHub Repo": "",
                    }, 
                    image: "images/projects/bg/bg.webp",
                    image2: "images/projects/bg/bg2.webp",
                    techs: ["Laravel", "VueJs", "SocketIO"],
                },

                {
                    title: "Unity Camera Shaker",
                    type: ["Development"],
                    description:
                        "This is a project I developed as a utility tool for the Unity game engine, the displayed illustration is a small game\
			            I programmed along for the sake of showing the effect at play.",
                    links: {
                        "GitHub Repo": "https://github.com/Somnef/UnityCameraShaker",
                    }, 
                    image: "images/projects/camera_shaker/camera_shaker.gif",
                    image2: "images/projects/camera_shaker/camera_shaker2.gif",
                    techs: ["Unity", "C#"],
                },

                {
                    title: "Small Battle RPGs",
                    type: ["Development"],
                    description:
                        "When I have time, I like to work on writing small RPGs with battle mechanics and cool pixel art designs!",
                    links: {
                    },
                    image: "images/projects/rpg/rpg.webp",
                    image2: "images/projects/rpg/rpg2.gif",
                    techs: ["Unity", "C#"],
                },

                {
                    title: "Physics Simulation of Planets Movement",
                    type: ["Development"],
                    description:
                        "Just a simple physics system in Unity to simulate the basic laws of gravity attraction, but the result \
			            is quite beautiful and... poetic ?",
                    links: {
                    },
                    image: "images/projects/planets/planets.gif",
                    image2: "images/projects/planets/planets2.gif",
                    techs: ["Unity", "C#"],
                },
            ],

            projects: [],
        }
    },

    mounted() {
        this.projects = this.all_projects;
    },

    watch: {
        currentFilter(newFilter) {
            if (newFilter === 'All') {
                this.projects = this.all_projects;
            } else {
                this.projects = this.all_projects.filter(project => project.type.includes(newFilter));
            }
        }
    },

    methods: {
        emitProjectClicked(info) {
            this.$emit('projectClicked', info);
        }
    }
}


</script>
