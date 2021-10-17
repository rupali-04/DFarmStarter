<script setup>
import Button from './Button.vue';
import Web3 from 'web3/dist/web3.min.js';
import abi from '../abi.json';
import {ref} from 'vue';

const minAmount = ref(0);
const cropAmount = ref(0);
const description = ref('');

const web3 = new Web3(window.web3.currentProvider);
const contract = new web3.eth.Contract(abi.abi, "0x5cB927D0D3c05DEBC7aCe91C0eDA1831Ffb110D4");

contract.methods.deployedCampaign(0).call((err, res) => {
  console.log(res)
})

async function createNewCampaign() {
  // const accounts = await web3.eth.getAccounts();
  const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
  contract.methods.createCampaign(description.value, minAmount.value, cropAmount.value)
    .send({from: accounts[0]});
}

</script>

<template>
<form @submit.prevent="createNewCampaign">
  <div class="bg-gray-100 p-4 rounded-sm w-full space-y-6 ring-4 ring-offset-white ring-blue-600 ring-offset-2">
    <div class="mb-2">
      <h1 class="text-center text-xl text-gray-600">Create Campaign</h1>
    </div>
    <div>
      <div class="mb-2">
        <label class="text-gray-600 mx-2" for="email">Min Amount:</label>
      </div>
      <div>
        <input type="number" name="email" class="w-full bg-gray-200 text-sm" v-model="minAmount" placeholder="Minimum amount" />
      </div>
    </div>
    <div>
      <div class="mb-2">
        <label class="text-gray-600 mx-2" for="email">Crop Amount:</label>
      </div>
      <div>
        <input type="number" name="email" class="w-full bg-gray-200 text-sm" v-model="cropAmount" placeholder="Crop Amount" />
      </div>
    </div>
    <div>
      <div class="mb-2">
        <label class="text-gray-600 mx-2" for="email">Description:</label>
      </div>
      <div>
        <textarea class="w-full bg-gray-200 text-sm" v-model="description" placeholder="Description goes here."></textarea>
      </div>
    </div>
    <div>
      <input type="submit" value="Create Campaign" class="bg-purple-600 px-4 py-2 font-semibold text-white text-xs uppercase">
    </div>
  </div>
  </form>
</template>