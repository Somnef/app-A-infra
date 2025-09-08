<template>

    <div  class="w-full h-full flex flex-col items-center justify-center p-[1rem] bg-dark-grey bg-opacity-0 group hover:bg-opacity-75 transition-all ease-in-out duration-300">
        <!-- <img :src="image" class="w-full lg:h-[10rem] h-[8rem] object-contain group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300" /> -->

        <div class="flex justify-center mb-[0.5rem] group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300">
            <div v-html="image"></div>
        </div>

        <div class="lg:text-sm text-xs text-center font-semibold text-middle-grey group-hover:text-green-tech group-hover:-translate-y-[0.5rem] transition-all ease-in-out duration-300">{{ name }}</div>
    </div>

</template>

<script>

export default {
    props: {
        name: String,
        image: String,
    }
}

</script>