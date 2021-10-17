<script setup>
const props = defineProps({text: String, onclick: Function})
</script>

<template>
<button @click="onclick()"
  class="font-semibold text-xs uppercase bg-purple-500 px-4 py-2 self-center rounded-sm"
>
  {{text}}
</button>
</template>