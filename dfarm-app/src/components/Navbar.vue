<script setup>
import Button from './Button.vue';
</script>

<template>
<div class="bg-gray-900">
  <div
    id="navbar"
    class="
      relative
      container mx-auto
      h-14
      bg-gray-900
      flex
      justify-between
      items-stretch
      bg-gray-00
      border-b-2 border-gray-700 border-opacity-25
      group
    "
  >
    <span class="font-bold p-3 uppercase text-gray-300 text-xl cursor-pointer">
      dfarm starter
      <span
        class="
          p-1.5
          ml-1
          text-xs
          rounded-full
          bg-pink-600
          group-hover:bg-pink-700
        "
        >💡</span
      >
    </span>
    <div
      id="menu"
      class="
        sm:hidden
        text-semibold text-gray-300
        cursor-pointer
        md:h-full md:flex
        z-40
        items-stretch
        sm:absolute
        md:static
        sm:top-full sm:left-0 sm:right-0
        md:bg-transparent
        sm:bg-gray-600
      "
    >
      <span
        class="
          transition
          duration-100
          ease-in-out
          font-semibold
          px-4
          hover:bg-pink-700
          sm:p-4
          flex
          items-center
        "
      >
        🛍️ Campaign
      </span>
      <span
        class="
          transition
          duration-100
          ease-in-out
          font-semibold
          px-4
          hover:bg-pink-700
          sm:p-4
          flex
          items-center
        "
        >🚟 Supplier</span
      >
      <span
        class="
          transition
          duration-100
          ease-in-out
          font-semibold
          px-4
          hover:bg-pink-700
          sm:p-4
          flex
          items-center
        "
        >☎️ Contact</span
      >
      <Button text="💳 Connect" />
    </div>
    <span
      id="menuBtn"
      class="
        select-none
        md:hidden
        absolute
        right-3
        top-1/2
        transform
        -translate-y-1/2
        w-10
        h-10
        flex
        items-center
        justify-center
        hover:bg-gray-700
        cursor-pointer
        bg-opacity-50
        rounded-full
      "
      >⚙️</span
    >
  </div>
  </div>
</template>
