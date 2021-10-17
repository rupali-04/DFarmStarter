<script setup>
import Navbar from "./components/Navbar.vue";
import CampaignCard from "./components/CampaignCard.vue";
import CreateCampaign from "./components/CreateCampaign.vue";
import { onMounted } from "vue";
import abi from './abi.json'
import Web3 from 'web3/dist/web3.min.js';
import { ref } from "vue"; 
import campaignAbi from './campaignAbi.json'

const web3 = new Web3(window.web3.currentProvider);
const contract = new web3.eth.Contract(abi.abi, "0x5cB927D0D3c05DEBC7aCe91C0eDA1831Ffb110D4");
const campaigns = ref([
  {id: 1, minAmount: 10, desc: "Growing Oranges"},
  {id: 2, minAmount: 4, desc: "Growing Sugarcane"},
  {id: 3, minAmount: 7, desc: "Growing Fruits"}
]);
const campaignInfo = ref();
// const campaigns = []

onMounted(() => {
  let campaignAddresses = {};
  contract.methods.getDeployedContracts().call((err, res) => {
    campaignAddresses = res;
    console.log(res, typeof res)
  })
  // campaignAddresses.push(campaigns.value[0])
  // console.log(campaignAddresses)
  // campaignInfo.value.forEach((e) => {
  //   console.log(e);
  // })
 // campaigns.value.forEach((a) => {console.log("A: ", a)})

  // campaigns.value.forEach((campaignAddress) => {
  // console.log(campaignAddress, "campaignAddress")
  const campaignContract = new web3.eth.Contract(campaignAbi.abi, "0x7240c1789Ea456cC223f2E56BeE396b5F277b0Dd")
  const data = {}
  campaignContract.methods.desc().call((err, res) => {
    data.desc = res;
  })
  campaignContract.methods.minAmount().call((err, res) => {
    data.minAmount = res;
  })
  // campaignContract.methods.crop_Production().call((err, res) => {
  //   data.cropAmount = res;
  // })
  console.log("Data:", data)
  // campaignInfo.value.push(data);
  // })
  campaigns.value.push(data)
  console.log("CampaignInfo:", campaigns)
})
</script>

<template>
  <div>
    <Navbar />
    <div class="max-w-2xl mx-auto">
      <div
        class="space-y-6 my-10"
      >
        <CreateCampaign />
        <CampaignCard
          v-for="i in campaigns"
          :key="i.desc"
          :title="i.desc"
          content="This is some random content that will be displayed in the card."
          buttonText="💰 Invest"
          :price="i.minAmount"
        />
      </div>
    </div>
  </div>
</template>

<style></style>
