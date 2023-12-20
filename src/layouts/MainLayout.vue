<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title> ทางประ Jump! </q-toolbar-title>
      </q-toolbar>
      <q-tabs v-model="tab" inline-label class="bg-secondary text-white">
        <q-tab name="routes" icon="route" label="เส้นทาง"></q-tab>
        <q-tab
          name="alarms"
          icon="confirmation_number"
          label="จอง/ซื้อตั๋ว"
        ></q-tab>
        <q-tab name="movies" icon="travel_explore" label="เช็คตั๋ว"></q-tab>
      </q-tabs>
    </q-header>

    <q-drawer v-model="leftDrawerOpen">
      <q-list>
        <q-item-label header> Menu </q-item-label>

        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from "vue";
import EssentialLink from "components/EssentialLink.vue";

const linksList = [
  {
    title: "เส้นทาง",
    caption: "สำรวจเส้นทางที่เปิดให้บริการ",
    icon: "route",
    // link: "https://quasar.dev",
  },
  {
    title: "จอง/ซื้อตั๋ว",
    caption: "สำรองตั๋วและซื้อตั๋วเที่ยวรถ",
    icon: "confirmation_number",
    // link: "https://github.com/quasarframework",
  },
  {
    title: "เช็คตั๋ว",
    caption: "ตรวจสอบรายละเอียดของตั๋ว",
    icon: "travel_explore",
    // link: "https://chat.quasar.dev",
  },
  {
    title: "ติดต่อเรา",
    // caption: "ตรวจสอบรายละเอียดของตั๋ว",
    icon: "contact_support",
    // link: "https://chat.quasar.dev",
  },
  {
    title: "ลงชื่อเข้าใช้",
    caption: "ไว้คราวหน้านะน้อง",
    icon: "login",
    // link: "https://chat.quasar.dev",
  },
];

export default defineComponent({
  name: "MainLayout",

  components: {
    EssentialLink,
  },

  setup() {
    const leftDrawerOpen = ref(false);

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer() {
        leftDrawerOpen.value = !leftDrawerOpen.value;
      },
    };
  },
});
</script>
