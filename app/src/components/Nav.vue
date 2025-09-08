<template>
  <div
    class="invisible lg:visible lg:fixed left-0 top-0 ml-[3%] mt-[42vh] w-[15%] flex flex-col text-light-grey text-lg"
  >
    <a
      @click="navClicked('about')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'about' ? 'text-green-tech' : 'text-light-grey'"
    >
      About me
    </a>
    <a
      @click="navClicked('certs')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'certs' ? 'text-green-tech' : 'text-light-grey'"
    >
      Certifications
    </a>
    <a
      @click="navClicked('projects')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'projects' ? 'text-green-tech' : 'text-light-grey'"
    >
      Personal projects
    </a>
    <a
      @click="navClicked('techs')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'techs' ? 'text-green-tech' : 'text-light-grey'"
    >
      Tech stack
    </a>
    <!-- <a @click="navClicked('current')" class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300" :class="current == 'current' ? 'text-green-tech' : 'text-light-grey'">
            Current position
        </a> -->
    <a
      @click="navClicked('experience')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'experience' ? 'text-green-tech' : 'text-light-grey'"
    >
      Professional experience
    </a>
    <a
      @click="navClicked('contact')"
      class="hover:cursor-pointer hover:text-middle-grey transition-all ease-in-out duration-300"
      :class="current == 'contact' ? 'text-green-tech' : 'text-light-grey'"
    >
      Contact me
    </a>
  </div>
</template>

<script>
export default {
  name: "Nav",

  emits: ["navClicked"],

  props: {
    current: String,
  },

  methods: {
    navClicked(title) {
      this.$emit("navClicked", title);
    },
  },
};
</script>
