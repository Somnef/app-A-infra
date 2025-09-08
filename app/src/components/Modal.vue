<template>
    <div @click="closeModal()" class="fixed top-0 left-0 w-screen h-screen overscroll-contain bg-dark-grey z-30 transition-all ease-in-out duration-500" :class="show ? 'opacity-75' : 'opacity-0 pointer-events-none'" />


    <div class="fixed top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 lg:w-2/3 lg:h-2/3 w-4/5 h-2/3 z-40 transition-all ease-in-out duration-500" :class="show ? 'opacity-100' : 'opacity-0 pointer-events-none'">
        <div class="fixed w-full h-full z-10">
            <img src="/images/texture.jpg" alt="" class="w-full h-full object-cover">
        </div>

        <div @click="closeModal()" class="fixed top-0 right-0 mt-[1rem] mr-[1rem] hover:cursor-pointer z-50">
            <svg width="40" height="40" viewbox="0 0 40 40"><path d="M 10,10 L 30,30 M 30,10 L 10,30" stroke="#f4f4f4" stroke-width="2" /></svg>
        </div>
        
        <div class="fixed flex flex-row w-full h-full bg-almost-black opacity-90 border border-light-grey z-40 transition-all ease-in-out duration-500" :class="show ? 'opacity-100' : 'opacity-0 pointer-events-none'">
            
            <div class="flex items-center justify-center lg:w-1/3 w-0">
                <img :src="info.image2" alt="" class="w-full h-full object-contain" :class="info.image2 == '' ? 'invisible' : 'visible'" />
            </div>

            <div class="flex flex-col lg:w-2/3 w-full lg:px-[2rem] lg:py-[2rem] px-[1rem] py-[3rem] overflow-y-scroll overscroll-contain">

                <div class="lg:text-4xl text-2xl text-light-grey">
                    {{ info.title }}
                </div>

                <div class="lg:text-base text-sm text-middle-grey mt-[2rem] px-[0.5rem]">
                    {{ info.description }}
                </div>

                <div v-if="info.techs.length > 0" class="lg:text-sm text-xs text-green-tech mt-[1rem]">
                    <p class="text-light-grey">Techs used:</p>
                    
                    <div class="grid lg:grid-cols-3 grid-cols-2 mt-[0.5rem] gap-y-[0.5rem] items-center justify-center text-xs">
                        <div v-for="tech in info.techs" class="flex items-center text-green-tech mr-[1rem] px-2 pt-[0.1rem] pb-[0.2rem] border border-light-grey">
                            {{ tech }}
                        </div>
                    </div>
                </div>
                
                <div class="flex flex-col mt-auto">
                    <p class="text-light-grey">Links:</p>
                    <div class="flex flex-row gap-x-[2rem] ">
                        <div v-for="(value, key) in info.links" :key="key">
                            <a :href="value" target="_blank" class="text-green-tech text-sm hover:text-middle-grey transition-all ease-in-out duration-300">{{ key }}</a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</template>

<script>

export default {
    name: 'Modal',

    emits: ['closeModal'],

    props: {
        info: Object,
        show: Boolean,
    },

    methods: {
        closeModal() {


            this.$emit('closeModal');
        }
    }
}

</script>