<template>
  <div class="container-fluid bg-light-green">
    <div class="text-center py-4">
      <h1 class="display-4">{{ titulo }}</h1>
      <div class="search-container">
        <div class="input-group mb-3">
          <input 
            type="text" 
            v-model="termo_busca" 
            class="form-control"
            placeholder="Digite o nome da operadora"
            @keyup.enter="buscar_operadoras"
          />
          <div class="input-group-append">
            <button 
              @click="buscar_operadoras" 
              class="btn btn-success"
            >
              <i class="bi bi-search"></i> Buscar
            </button>
          </div>
        </div>
        
        <div v-if="carregando" class="loading">
          <div class="spinner-border text-success" role="status">
            <span class="sr-only">Carregando...</span>
          </div>
        </div>
        
        <div v-if="erro" class="alert alert-danger">{{ erro }}</div>
        
        <div v-if="operadoras.length > 0" class="results">
          <h3 class="my-4">Resultados ({{ total }} encontrados)</h3>
          <ul class="list-group">
            <li 
              v-for="op in operadoras" 
              :key="op.Registro_ANS"
              class="list-group-item"
            >
              {{ op.Razao_Social }} - CNPJ: {{ op.CNPJ }} (Registro: {{ op.Registro_ANS }})
            </li>
          </ul>
          
          <div class="pagination mt-4">
            <button 
              @click="mudar_pagina(-1)" 
              class="btn btn-outline-success"
              :disabled="offset === 0"
            >
              Anterior
            </button>
            <span class="mx-3">Página {{ pagina_atual }} de {{ total_paginas }}</span>
            <button 
              @click="mudar_pagina(1)" 
              class="btn btn-outline-success"
              :disabled="offset + limit >= total"
            >
              Próxima
            </button>
          </div>
        </div>
        
        <div v-else-if="mostrar_nenhum_resultado" class="no-results">
          <div class="alert alert-info">
            <i class="bi bi-exclamation-circle"></i> Nenhuma operadora encontrada.
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'BuscaOperadorasAtivas',
  data() {
    return {
      titulo: 'Busca por Operadoras Ativas',
      termo_busca: '',
      operadoras: [],
      total: 0,
      limit: 10,
      offset: 0,
      carregando: false,
      erro: null,
      mostrar_nenhum_resultado: false
    }
  },
  computed: {
    pagina_atual() {
      return Math.floor(this.offset / this.limit) + 1;
    },
    total_paginas() {
      return Math.ceil(this.total / this.limit);
    }
  },
  methods: {
    async buscar_operadoras() {
      if (this.termo_busca.length > 0 && this.termo_busca.length < 3) {
        this.erro = "Digite pelo menos 3 caracteres para buscar";
        this.operadoras = [];
        this.mostrar_nenhum_resultado = false;
        return;
      }
      
      this.carregando = true;
      this.erro = null;
      this.mostrar_nenhum_resultado = false;
      
      try {
        const response = await axios.get('http://127.0.0.1:8000/operadoras/', {
          params: {
            nome: this.termo_busca,
            limit: this.limit,
            offset: this.offset
          }
        });
        
        this.operadoras = response.data.data;
        this.total = response.data.total;
        this.mostrar_nenhum_resultado = this.operadoras.length === 0;
      } catch (error) {
        this.erro = "Erro ao buscar operadoras: " + (error.response?.data?.detail || error.message);
        this.operadoras = [];
        this.mostrar_nenhum_resultado = false;
      } finally {
        this.carregando = false;
      }
    },
    mudar_pagina(direction) {
      const new_offset = this.offset + (direction * this.limit);
      if (new_offset >= 0 && new_offset < this.total) {
        this.offset = new_offset;
        this.buscar_operadoras();
      }
    }
  }
}
</script>

<style scoped>

.display-4 {
  font-weight: bold;
  margin-bottom: 40px;
}

.bg-light-green {
  background-color: #e8f5e9; 
  min-height: 100vh;
  padding: 20px;
}

.input-group {
  display: flex;
  gap: 20px
}

.search-container {
  max-width: 1000px;
  margin: 0 auto;
  background-color: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.list-group-item {
  transition: all 0.5s;
  font-size: 14px;
}

.list-group-item:hover {
  background-color: #f8f9fa;
  transform: translateX(5px);
}

.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
}

.no-results i, .loading i {
  margin-right: 8px;
}
</style>