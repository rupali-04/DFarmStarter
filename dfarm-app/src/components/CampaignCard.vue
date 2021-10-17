<script setup>
const props = defineProps({
  title: String,
  content: String,
  buttonText: String,
  price: Number
})
</script>

<template>
  <div
    class="
      w-full
      bg-gray-200
      rounded-sm
      overflow-hidden
      shadow-xl
      group
      border-2
      ring-4 ring-indigo-600
    "
  >
    <div
      id="heading"
      class="py-2 text-center bg-indigo-600 text-lg font-bold text-white"
    >
      <h1>
        {{title}}
      </h1>
    </div>
    <div id="body" class="px-3 py-4">
      <p class="group-hover:text-indigo-900">
        {{content}}
      </p>
    </div>
    <div id="footer" class="p-2 flex items-center justify-between bg-gray-300">
      <span class="text-sm font-semibold">
        {{price}} ETH
      </span>
      <button
        class="
          bg-indigo-600
          px-6
          py-2
          text-white
          font-semibold
          text-sm
          rounded-md
          hover:bg-indigo-600
          focus-visible:bg-red-700
        "
      >
        {{buttonText}}
      </button>
    </div>
  </div>
</template>
