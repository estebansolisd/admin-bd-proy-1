<template>
    <b-container fluid>
        <b-row>
            <!-- LIST COCHES -->
            <b-col cols="12" md="6">
                <b-table
                    responsive
                    small
                    sticky-header
                    class="shadow"
                    striped
                    :fields="fields"
                    emptyText="No tienes coches porfavor agrega unos !"
                    showEmpty
                    :items="coches"
                >
                    <template v-slot:cell(oficina)="data">
                        Oficina #{{ data.item.oficina.idOficina }}
                        {{ data.item.oficina.ciudad }}
                        {{ data.item.oficina.calleNumero }}
                    </template>
                    <template v-slot:cell(edad_minima)="data">
                        {{ data.item.edadMinima }}
                    </template>
                    <template v-slot:cell(actualizar)="data">
                        <div
                            class="h-100 w-100 d-flex align-items-center justify-content-center"
                        >
                            <b-icon
                                style="cursor: pointer;"
                                icon="pencil"
                                variant="warning"
                                font-scale="1"
                                @click="handleClick"
                                data-el_name="btnUpdateCoche"
                                :data-el_value="JSON.stringify(data.item)"
                            />
                        </div>
                    </template>
                    <template
                        class="d-flex align-items-center justify-content-center"
                        v-slot:cell(eliminar)="data"
                    >
                        <div
                            class="h-100 w-100 d-flex align-items-center justify-content-center"
                        >
                            <b-icon
                                style="cursor: pointer;"
                                icon="trash"
                                variant="danger"
                                font-scale="1"
                                @click="handleClick"
                                data-el_name="btnDeleteCoche"
                                :data-el_value="data.item.idCoche"
                            />
                        </div>
                    </template>
                </b-table>
            </b-col>

            <!-- FORM COCHES -->
            <b-col cols="12" md="6">
                <b-card
                    class="shadow"
                    header="Crud de coches"
                    header-tag="header"
                >
                    <b-form @submit="handleSubmit" data-el_name="frmCoches">
                        <!-- MATRICULA & GRUPO -->
                        <b-form-row class="p-1">
                            <b-col cols="12" md="6">
                                <label>
                                    Digite la matricula del coche...
                                </label>
                                <b-form-input
                                    v-model="cocheActual.matricula"
                                    maxlength="10"
                                    required
                                />
                            </b-col>
                            <b-col cols="12" md="6">
                                <label>
                                    Seleccione el grupo del coche...
                                </label>
                                <b-form-select
                                    required
                                    v-model="cocheActual.grupo"
                                    :options="grupos"
                                ></b-form-select>
                            </b-col>
                        </b-form-row>

                        <!-- MARCA & MODELO -->
                        <b-form-row class="p-1">
                            <b-col cols="12" md="6">
                                <label>
                                    Digite la marca del coche...
                                </label>
                                <b-form-input
                                    required
                                    maxlength="20"
                                    v-model="cocheActual.marca"
                                    type="text"
                                />
                            </b-col>
                            <b-col cols="12" md="6">
                                <label>
                                    Digite el modelo del coche...
                                </label>
                                <b-form-input
                                    required
                                    maxlength="10"
                                    v-model="cocheActual.modelo"
                                    type="text"
                                />
                            </b-col>
                        </b-form-row>

                        <!-- PUERTAS & PLAZAS -->
                        <b-form-row class="p-1">
                            <b-col cols="12" md="6">
                                <label>
                                    Digite el numero de puertas del coche...
                                </label>
                                <b-form-input
                                    required
                                    v-model="cocheActual.puertas"
                                    :min="1"
                                    type="number"
                                />
                            </b-col>
                            <b-col cols="12" md="6">
                                <label>
                                    Digite el numero de plazas del coche...
                                </label>
                                <b-form-input
                                    required
                                    v-model="cocheActual.plazas"
                                    :min="1"
                                    type="number"
                                />
                            </b-col>
                        </b-form-row>

                        <!-- MALETERO & EDAD MINIMA  -->
                        <b-form-row class="p-1">
                            <b-col cols="12" md="6">
                                <label>
                                    Digite el numero de maleteros del coche...
                                </label>
                                <b-form-input
                                    required
                                    v-model="cocheActual.maletero"
                                    :min="1"
                                    type="number"
                                />
                            </b-col>
                            <b-col cols="12" md="6">
                                <label>
                                    Digite la edad minima para adquirir el
                                    coche...
                                </label>
                                <b-form-input
                                    required
                                    v-model="cocheActual.edadMinima"
                                    :min="18"
                                    type="number"
                                />
                            </b-col>
                        </b-form-row>

                        <b-form-row class="p-1">
                            <b-col cols="12" md="6">
                                <label>
                                    Seleccione una oficina para el coche...
                                </label>
                                <b-form-select
                                    required
                                    v-model="cocheActual.idOficina"
                                    :options="
                                        this.oficinas.map(o => ({
                                            text: `Oficina #${o.idOficina} ${o.ciudad} ${o.calleNumero}`,
                                            value: o.idOficina
                                        }))
                                    "
                                >
                                    <b-form-select-option
                                        :value="null"
                                        disabled
                                        hidden
                                        >Selecciona una de las
                                        opciones...</b-form-select-option
                                    >
                                </b-form-select>
                            </b-col>
                        </b-form-row>

                        <b-button class="mt-2" type="submit" variant="primary">
                            <div v-if="isLoadingSave">
                                <b-spinner small />
                                <span>
                                    Guardando...
                                </span>
                            </div>
                            <span v-else>
                                Guardar
                            </span>
                        </b-button>
                    </b-form>
                </b-card>
            </b-col>
        </b-row>
    </b-container>
</template>

<script>
import { sendAPIRequest } from "../utils/API";
export default {
    data() {
        return {
            cocheActual: {
                matricula: "",
                marca: "",
                grupo: "A",
                puertas: 4,
                plazas: 5,
                maletero: 1,
                edadMinima: 18,
                idOficina: null,
                idCoche: -1
            },
            grupos: [
                { value: "A", text: "A" },
                { value: "B", text: "B" },
                { value: "C", text: "C" },
                { value: "D", text: "D" },
                { value: "E", text: "E" },
                { value: "F", text: "F" },
                { value: "G", text: "G" }
            ],
            items: [
                { age: 40, first_name: "Dickerson", last_name: "Macdonald" },
                { age: 21, first_name: "Larsen", last_name: "Shaw" },
                { age: 89, first_name: "Geneva", last_name: "Wilson" },
                { age: 38, first_name: "Jami", last_name: "Carney" }
            ],
            oficinas: [],
            coches: [],
            fields: [
                "actualizar",
                "eliminar",
                "matricula",
                "grupo",
                "marca",
                "modelo",
                "puertas",
                "plazas",
                "maletero",
                "edad_minima",
                "oficina"
            ],
            isLoadingSave: false
        };
    },
    methods: {
        async handleSubmit(e) {
            switch (e.currentTarget.dataset.el_name) {
                case "frmCoches":
                    e.preventDefault();
                    try {
                        this.isLoadingSave = true;
                        const res =
                            this.cocheActual.idCoche === -1
                                ? await sendAPIRequest(
                                      "/coches",
                                      "POST",
                                      this.cocheActual
                                  )
                                : await sendAPIRequest(
                                      `/coches/${this.cocheActual.idCoche}`,
                                      "PATCH",
                                      this.cocheActual
                                  );
                        setTimeout(() => {
                            this.isLoadingSave = false;
                            this.cleanData();
                            this.loadCoches();
                        }, 500);
                    } catch (err) {
                        this.isLoadingSave = false;
                        this.cleanData();
                        console.error(err);
                    }
                    break;
                default:
                    break;
            }
        },
        loadOficinas() {
            sendAPIRequest("/oficinas", "GET")
                .then(res => {
                    this.oficinas = res.data;
                })
                .catch(err => {
                    console.error(err);
                });
        },
        loadCoches() {
            sendAPIRequest("/coches", "GET")
                .then(res => {
                    this.coches = res.data;
                })
                .catch(err => {
                    console.error(err);
                });
        },
        cleanData() {
            this.cocheActual = {
                matricula: "",
                marca: "",
                grupo: "A",
                puertas: 4,
                plazas: 5,
                maletero: 1,
                edadMinima: 18,
                idOficina: null,
                idCoche: -1
            };
        },
        async handleClick(e) {
            switch (e.currentTarget.dataset.el_name) {
                case "btnDeleteCoche":
                    if (confirm("Deseas eliminar este coche ?")) {
                        try {
                            const idCoche = Number(
                                e.currentTarget.dataset.el_value
                            );

                            const res = await sendAPIRequest(
                                `/coches/${idCoche}`,
                                "DELETE"
                            );
                            this.loadCoches();
                        } catch (err) {
                            console.error(err);
                        }
                    }
                    break;
                case "btnUpdateCoche":
                    try {
                        this.cocheActual = JSON.parse(
                            e.currentTarget.dataset.el_value
                        );
                    } catch (err) {
                        console.error(err);
                    }
                    break;
                default:
                    break;
            }
        }
    },
    mounted() {
        this.loadOficinas();
        this.loadCoches();
    }
};
</script>

<style></style>
